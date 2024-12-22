@echo off

REM URL ve path'lerin bulunduğu dosya
set "file=urls.txt"

REM urls.txt dosyasını satır satır oku
for /f "tokens=1,2 delims= " %%A in (%file%) do (
    echo İndiriliyor: %%A

    REM Tam yol ile curl kullanarak URL'yi indir ve belirlenen path'e kaydet
    C:\Windows\System32\curl.exe -L -o "%%B" "%%A"

    REM İndirme kontrolü
    if %ERRORLEVEL% equ 0 (
        echo Başarıyla indirildi: %%B
    ) else (
        echo İndirme başarısız oldu: %%A
    )
)