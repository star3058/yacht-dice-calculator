@echo off
echo.
echo                 ȯ���ȣ�� 1^&2 �ѱ��� ��ġ v1.01
echo --------------------------------------------------------------
echo          �� �ѱ��� ��ġ�� �񿵸� �������� ���۵Ǿ�����
echo                   ����� �̿��� �����մϴ�.
echo --------------------------------------------------------------
echo.
echo.
if exist "suikoden.iso.iso" ren suikoden.iso.iso suikoden.iso
if exist "suikoden.iso" echo ��ġ ���Դϴ�... â�� ���� ������.
if exist "suikoden.iso" echo.
datas\xdelta3.exe -d -s "suikoden.iso" "datas\1.xdelta" "temp.iso" >nul 2>&1
if not exist "temp.iso" datas\xdelta3.exe -d -s "suikoden.iso" "datas\2.xdelta" "temp.iso" >nul 2>&1
datas\xdelta3.exe -d -s "suikoden.iso" "datas\3.xdelta" "suikoden_kor.iso" >nul 2>&1
datas\xdelta3.exe -d -s "temp.iso" "datas\3.xdelta" "suikoden_kor.iso" >nul 2>&1
del temp.iso >nul 2>&1
if exist "suikoden_kor.iso" echo ��ġ�� �Ϸ�Ǿ����ϴ�.
if exist "suikoden_kor.iso" echo.
if exist "suikoden_kor.iso" echo �ѱ��� ��ġ�� �Ϸ�� ������ �̸��� suikoden_kor.iso�Դϴ�.
if exist "suikoden_kor.iso" echo �����Ϸ��� �ƹ�Ű�� ��������.
if exist "suikoden_kor.iso" pause>nul
if exist "suikoden_kor.iso" exit
if not exist "suikoden_kor.iso" echo ��ġ�� �����߽��ϴ�.
if not exist "suikoden_kor.iso" echo.
if not exist "suikoden_kor.iso" echo ���� ���� �̸��� suikoden.iso�� �ٲ����, �� ��ġ ���ϰ� ���� ��ο� �ִ��� �ٽ� Ȯ���ϼ���.
if not exist "suikoden_kor.iso" echo �����Ϸ��� �ƹ�Ű�� ��������.
if not exist "suikoden_kor.iso" pause>nul
if not exist "suikoden_kor.iso" exit