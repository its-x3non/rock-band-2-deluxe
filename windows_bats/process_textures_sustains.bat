del /f "%~dp0..\_ark\track\sustains\sustains.dta"
cd "%~dp0..\custom_textures\sustains"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> sustains.dta
for %%i in (*.png) do @echo "%%~ni">> sustains.dta
for %%i in (*.jpg) do @echo "%%~ni">> sustains.dta
move "%~dp0..\custom_textures\sustains\sustains.dta" "%~dp0..\_ark\track\sustains\sustains.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/track_flash_blue_//g" "%~dp0..\_ark\track\sustains\sustains.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/track_flash_blue_glow_//g" "%~dp0..\_ark\track\sustains\sustains.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/track_flash_green_//g" "%~dp0..\_ark\track\sustains\sustains.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/track_flash_green_glow_//g" "%~dp0..\_ark\track\sustains\sustains.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/track_flash_orange_//g" "%~dp0..\_ark\track\sustains\sustains.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/track_flash_orange_glow_//g" "%~dp0..\_ark\track\sustains\sustains.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/track_flash_red_//g" "%~dp0..\_ark\track\sustains\sustains.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/track_flash_red_glow_//g" "%~dp0..\_ark\track\sustains\sustains.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/track_flash_yellow_//g" "%~dp0..\_ark\track\sustains\sustains.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/track_flash_yellow_glow_//g" "%~dp0..\_ark\track\sustains\sustains.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\sustains/%%G" "%~dp0..\custom_textures\sustains\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\sustains/%%G" "%~dp0..\custom_textures\sustains\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\sustains/%%G" "%~dp0..\_ark\track\sustains\gen\%%~nG.png_xbox" --platform x360 --miloVersion 25
del sed* /a /s
cd "%~dp0..\_ark/track/sustains/gen"
FOR /F "tokens=*" %%G IN ('dir /b *.png_xbox') DO python "%~dp0..\dependencies/swap_rb_art_bytes.py" "%~dp0..\_ark/track/sustains/gen/%%G" "%~dp0..\_ark/track/sustains/gen/%%~nG.png_ps3"