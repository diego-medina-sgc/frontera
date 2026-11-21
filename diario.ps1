# Rutina diaria de Frontera.
#
# Hace lo que no necesita criterio: salir a buscar al mundo, filtrar, y
# dejar el informe listo. Lo que sí necesita criterio —decidir qué
# merece una lección y escribirla— queda para cuando te sientes, con el
# skill del radar.
#
# Probarlo a mano:
#   powershell -ExecutionPolicy Bypass -File "C:\Users\Usuario\Desktop\Claude\Code\Frontera\diario.ps1"
#
# Para que corra solo todos los días a las 7, una sola vez:
#   schtasks /create /tn "Frontera diario" /tr "powershell -ExecutionPolicy Bypass -WindowStyle Hidden -File \"C:\Users\Usuario\Desktop\Claude\Code\Frontera\diario.ps1\"" /sc daily /st 07:00
#
# Para sacarlo:
#   schtasks /delete /tn "Frontera diario" /f

$raiz = $PSScriptRoot
$log  = Join-Path $raiz "jobs\salida\diario.log"
$hoy  = Get-Date -Format "yyyy-MM-dd HH:mm"

function Registrar($texto) {
    Add-Content -Path $log -Value "$hoy  $texto" -Encoding UTF8
}

Set-Location $raiz

# 1. El radar: recolecta, filtra y guarda las señales nuevas.
try {
    $salida = & node "jobs\radar.mjs" --guardar 2>&1 | Out-String
    $nuevas = ([regex]::Match($salida, "Nuevas en la base: (\d+)")).Groups[1].Value
    Registrar "radar ok - $nuevas senales nuevas"
} catch {
    Registrar "radar FALLO - $($_.Exception.Message)"
}

# 2. El informe con las candidatas, para cuando te sientes a escribir.
try {
    & node "jobs\radar.mjs" --informe 2>&1 | Out-Null
    Registrar "informe ok"
} catch {
    Registrar "informe FALLO - $($_.Exception.Message)"
}

# 3. Los controles. Si algo de la base se rompio, que quede anotado.
try {
    & node "jobs\revisar.mjs" 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) { Registrar "controles en verde" }
    else { Registrar "CONTROLES CON FALLAS - correr: node jobs/revisar.mjs" }
} catch {
    Registrar "controles FALLO - $($_.Exception.Message)"
}

# El perfil por evidencia una vez por semana: lee 1,2 GB y no tiene
# sentido hacerlo todos los dias.
if ((Get-Date).DayOfWeek -eq "Monday") {
    try {
        & node "jobs\evidencia.mjs" --guardar 2>&1 | Out-Null
        Registrar "evidencia actualizada (lunes)"
    } catch {
        Registrar "evidencia FALLO - $($_.Exception.Message)"
    }
}

Registrar "---"
