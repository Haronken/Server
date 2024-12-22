@echo off

REM URL ve path'lerin bulunduğu dosya
set "file=urls.txt"

REM urls.txt dosyasını satır satır oku
for /f "tokens=1,2 delims= " %%A in (%file%) do (
    echo İndiriliyor: %%A

    REM PowerShell kullanarak URL'yi indir ve belirlenen path'e kaydet
    powershell -Command "Invoke-WebRequest -Uri '%%A' -OutFile '%%B'"

    REM İndirme kontrolü
    if %ERRORLEVEL% equ 0 (
        echo Başarıyla indirildi: %%B
    ) else (
        echo İndirme başarısız oldu: %%A
    )
)