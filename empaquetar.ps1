# Empaqueta la carpeta app para subirla a Cloudflare Pages.
#
# Existe por una razón concreta: Compress-Archive falla cuando el
# antivirus está escaneando un archivo recién escrito. Reintenta y
# verifica que el zip tenga todo antes de darlo por bueno.

$origen = Join-Path $PSScriptRoot 'app'
$zip    = Join-Path $env:TEMP 'frontera.zip'
$stage  = Join-Path $env:TEMP ('frontera-stage-' + [guid]::NewGuid().ToString('N').Substring(0, 8))

$esperados = (Get-ChildItem $origen -File).Count

New-Item -ItemType Directory -Path $stage | Out-Null
Copy-Item "$origen\*" -Destination $stage -Force

if (Test-Path $zip) { Remove-Item $zip -Force }

$ok = $false
foreach ($intento in 1..5) {
    try {
        Compress-Archive -Path "$stage\*" -DestinationPath $zip -Force -ErrorAction Stop
        $ok = $true
        break
    } catch {
        Write-Host "Intento $intento bloqueado, reintento en 3s..."
        Start-Sleep -Seconds 3
        if (Test-Path $zip) { Remove-Item $zip -Force }
    }
}

Remove-Item $stage -Recurse -Force

if (-not $ok) {
    Write-Host "No pude empaquetar despues de 5 intentos."
    exit 1
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
$archivo = [IO.Compression.ZipFile]::OpenRead($zip)
$dentro = $archivo.Entries.Count
$nombres = ($archivo.Entries | ForEach-Object { $_.FullName }) -join ', '
$archivo.Dispose()

if ($dentro -ne $esperados) {
    Write-Host "El zip tiene $dentro archivos y la carpeta tiene $esperados. Algo falto."
    exit 1
}

Write-Host "Listo: $zip"
Write-Host "$dentro archivos - $([math]::Round((Get-Item $zip).Length / 1KB, 1)) KB"
Write-Host $nombres
