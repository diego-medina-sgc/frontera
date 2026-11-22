# Genera los PNG del icono a partir de la misma geometria que icono.svg.
#
# Existe por una razon concreta: iOS no acepta SVG como apple-touch-icon.
# Si no hay PNG, el icono que queda en la pantalla de inicio del iPhone
# es una miniatura de la pagina, que es exactamente lo que se queria
# evitar. Android ademas necesita una version "maskable", que es la
# misma pero con aire alrededor porque el sistema la recorta en circulo.
#
# Para volver a generarlos despues de tocar el SVG:
#   powershell -ExecutionPolicy Bypass -File iconos.ps1

Add-Type -AssemblyName System.Drawing

$destino = Join-Path $PSScriptRoot 'app'

$negro = [System.Drawing.ColorTranslator]::FromHtml('#15161a')
$lima  = [System.Drawing.ColorTranslator]::FromHtml('#d7f24b')
$piso  = [System.Drawing.ColorTranslator]::FromHtml('#3a4030')

# El centro real del dibujo, trazos incluidos, que no es el centro de
# la caja: el punto empuja todo hacia arriba y a la derecha. Centrar la
# caja en vez del dibujo es lo que dejaba el icono corrido.
$centroX = 274.0
$centroY = 249.5

function New-Icono {
    param(
        [int]$Tamano,
        [string]$Archivo,
        # A sangre: el fondo ocupa el cuadrado entero y no se redondean
        # las esquinas, porque las redondea el sistema. iOS le aplica su
        # propia mascara al apple-touch-icon, asi que si le mandamos las
        # esquinas ya hechas quedan dos redondeos encimados y se ve un
        # borde oscuro.
        [bool]$Sangre = $false,
        # Cuanto del cuadrado ocupa el dibujo. Android recorta un
        # circulo sobre el icono maskable, asi que ahi hace falta aire.
        [double]$Ocupa = 1.0
    )

    $bmp = New-Object System.Drawing.Bitmap $Tamano, $Tamano
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic

    $fondo = New-Object System.Drawing.SolidBrush $negro

    if ($Sangre) {
        $g.FillRectangle($fondo, 0, 0, $Tamano, $Tamano)
    } else {
        $r = [int]($Tamano * 112 / 512)
        $camino = New-Object System.Drawing.Drawing2D.GraphicsPath
        $d = $r * 2
        $camino.AddArc(0, 0, $d, $d, 180, 90)
        $camino.AddArc($Tamano - $d, 0, $d, $d, 270, 90)
        $camino.AddArc($Tamano - $d, $Tamano - $d, $d, $d, 0, 90)
        $camino.AddArc(0, $Tamano - $d, $d, $d, 90, 90)
        $camino.CloseFigure()
        $g.FillPath($fondo, $camino)
        $camino.Dispose()
    }

    $escala = ($Tamano / 512.0) * $Ocupa

    # Centrar el dibujo, no la caja.
    $corrimientoX = ($Tamano / 2.0) - ($centroX * $escala)
    $corrimientoY = ($Tamano / 2.0) - ($centroY * $escala)

    # Las mismas coordenadas que el SVG, llevadas a la escala que toque.
    function P([double]$x, [double]$y) {
        New-Object System.Drawing.PointF(
            [float](($x * $escala) + $corrimientoX),
            [float](($y * $escala) + $corrimientoY)
        )
    }

    $lapizPiso = New-Object System.Drawing.Pen $piso, ([float](18 * $escala))
    $lapizPiso.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $lapizPiso.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
    $g.DrawLine($lapizPiso, (P 112 392), (P 400 392))

    $lapizLinea = New-Object System.Drawing.Pen $lima, ([float](36 * $escala))
    $lapizLinea.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $lapizLinea.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
    $lapizLinea.LineJoin = [System.Drawing.Drawing2D.LineJoin]::Round
    $g.DrawLines($lapizLinea, @((P 112 344), (P 236 292), (P 352 184)))

    $pincelPunto = New-Object System.Drawing.SolidBrush $lima
    $radio = 42 * $escala
    $centro = P 412 140
    $g.FillEllipse($pincelPunto, [float]($centro.X - $radio), [float]($centro.Y - $radio),
                   [float]($radio * 2), [float]($radio * 2))

    $ruta = Join-Path $destino $Archivo
    $bmp.Save($ruta, [System.Drawing.Imaging.ImageFormat]::Png)

    $lapizPiso.Dispose(); $lapizLinea.Dispose(); $pincelPunto.Dispose()
    $fondo.Dispose(); $g.Dispose(); $bmp.Dispose()

    $kb = [math]::Round((Get-Item $ruta).Length / 1KB, 1)
    Write-Host "$Archivo - $Tamano x $Tamano - $kb KB"
}

# iPhone: a sangre, la mascara la pone iOS.
New-Icono -Tamano 180 -Archivo 'icono-180.png' -Sangre $true

# Android y escritorio: con las esquinas hechas, como el SVG.
New-Icono -Tamano 192 -Archivo 'icono-192.png'
New-Icono -Tamano 512 -Archivo 'icono-512.png'

# Android maskable: a sangre y con aire, porque recorta en circulo. El
# 0.80 deja la diagonal del dibujo (376) adentro del circulo seguro
# del 80% del lado (410).
New-Icono -Tamano 512 -Archivo 'icono-512-maskable.png' -Sangre $true -Ocupa 0.80

Write-Host "Listo."
