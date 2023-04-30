@echo off
echo.
echo                 환상수호전 1^&2 한국어 패치 v1.01
echo --------------------------------------------------------------
echo          이 한국어 패치는 비영리 목적으로 제작되었으며
echo                   상업적 이용을 금지합니다.
echo --------------------------------------------------------------
echo.
echo.
if exist "suikoden.iso.iso" ren suikoden.iso.iso suikoden.iso
if exist "suikoden.iso" echo 패치 중입니다... 창을 끄지 마세요.
if exist "suikoden.iso" echo.
datas\xdelta3.exe -d -s "suikoden.iso" "datas\1.xdelta" "temp.iso" >nul 2>&1
if not exist "temp.iso" datas\xdelta3.exe -d -s "suikoden.iso" "datas\2.xdelta" "temp.iso" >nul 2>&1
datas\xdelta3.exe -d -s "suikoden.iso" "datas\3.xdelta" "suikoden_kor.iso" >nul 2>&1
datas\xdelta3.exe -d -s "temp.iso" "datas\3.xdelta" "suikoden_kor.iso" >nul 2>&1
del temp.iso >nul 2>&1
if exist "suikoden_kor.iso" echo 패치가 완료되었습니다.
if exist "suikoden_kor.iso" echo.
if exist "suikoden_kor.iso" echo 한국어 패치가 완료된 파일의 이름은 suikoden_kor.iso입니다.
if exist "suikoden_kor.iso" echo 종료하려면 아무키나 누르세요.
if exist "suikoden_kor.iso" pause>nul
if exist "suikoden_kor.iso" exit
if not exist "suikoden_kor.iso" echo 패치에 실패했습니다.
if not exist "suikoden_kor.iso" echo.
if not exist "suikoden_kor.iso" echo 게임 파일 이름을 suikoden.iso로 바꿨는지, 이 배치 파일과 같은 경로에 있는지 다시 확인하세요.
if not exist "suikoden_kor.iso" echo 종료하려면 아무키나 누르세요.
if not exist "suikoden_kor.iso" pause>nul
if not exist "suikoden_kor.iso" exit