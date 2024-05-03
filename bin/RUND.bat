echo off

rem Directorio donde estan los archivos
set FILE_PREFIX=C:\Cobol.
set SCRIPT_PREFIX=C:\Cobol
set A_CONFIG=\Cobol\cblconfi

WRUN32 -zd \Cobol\%1
