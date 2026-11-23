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

$negro  = [System.Drawing.ColorTranslator]::FromHtml('#15161a')
$lima   = [System.Drawing.ColorTranslator]::FromHtml('#d7f24b')
$blanco = [System.Drawing.ColorTranslator]::FromHtml('#ffffff')

# El centro real del dibujo, que no es el centro de la caja: la barra
# suelta se va a la derecha y arriba. Centrar la caja en vez del dibujo
# es lo que dejaba el icono corrido.
#   barra:  x 138..420   y 120..182
#   cuerpo: x 160..345   y 208..400
$centroX = 279.0
$centroY = 260.0

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

    # Las mismas dos piezas que el SVG, en el mismo orden.

    # La barra suelta: la que cruzo. Es lo unico en verde.
    $pincelLima = New-Object System.Drawing.SolidBrush $lima
    $g.FillPolygon($pincelLima, @((P 160 120), (P 420 120), (P 398 182), (P 138 182)))

    # El cuerpo de la F.
    $pincelBlanco = New-Object System.Drawing.SolidBrush $blanco
    $g.FillPolygon($pincelBlanco, @(
        (P 160 208), (P 225 208), (P 225 250), (P 345 250),
        (P 323 312), (P 225 312), (P 225 370), (P 160 400)
    ))

    $ruta = Join-Path $destino $Archivo
    $bmp.Save($ruta, [System.Drawing.Imaging.ImageFormat]::Png)

    $pincelLima.Dispose(); $pincelBlanco.Dispose()
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
# 0.80 deja la diagonal del dibujo (397, de 282 x 280) adentro del
# circulo seguro del 80% del lado (410).
New-Icono -Tamano 512 -Archivo 'icono-512-maskable.png' -Sangre $true -Ocupa 0.80

Write-Host "Listo."
