@echo off

echo 初期化中

cls

set vs=1.10.8 Release1
set cls=t
set programname=WebSiteMaker

title %programname% Version %vs%
echo ==============================
echo %programname%
echo Version : %vs%
echo ==============================
echo.
echo.
echo.
goto file


:file
set randomcheck=%random%
set imput=%randomcheck%
set /p imput="作成したいファイルの名前を入力してください: "
if "%imput%" == "%randomcheck%" (goto file)
set filename=%imput%
echo.
echo 同名ファイルの調査中...

if exist "%filename%.html" (
echo.
echo 【警告】同名ファイルが存在します
echo 手動で削除するか、別の名前を選択してください
echo.
echo Warning : A file with the same name exists!
echo Please Delete Manually or Choose Another Name.
echo.
goto file
)
echo ^[OK^]
echo.
echo ^<!DOCTYPE html^>>>%filename%.html
echo ^<html lang=ja^>>>%filename%.html
echo.>>%filename%.html
echo  ^<head^>>>%filename%.html
goto siteName


:sitename
set randomcheck=%random%
set imput=%randomcheck%
set /p imput="ページタイトルを入力してください: "
if "%imput%" == "%randomcheck%" (goto sitename)
set sitename=%imput%
echo     ^<title^> %sitename% ^</title^>>>%filename%.html
echo     ^<meta charset="ANSI"^>>>%filename%.html
echo     ^<!--^<p^>Made by WebsiteMaker %vs%^</p^>--^>>>%filename%.html
echo   ^</head^>>>%filename%.html
echo   ^<body^>>>%filename%.html
goto editmain


:editmain
title Edit - "%filename%.html"

if not exist "%filename%.html" (
title CAN'T FIND - "%filename%.html"
echo.
echo.
echo 【致命的エラー】

echo "%filename%.html"が見つかりません
echo 処理を続行できません...
echo.
echo "%filename%.html" Not Found
echo Unable to continue...
echo.
echo Press Any Key to Search Again
pause>>nul
goto editmain
)

set randomcheck=%random%
set imput=%randomcheck%
if "%cls%" == "t" (cls) else (echo.&echo.&echo.)

echo =======^> Choose item ^<=======

echo 0: このプログラムについて

echo 1: 現状閲覧

echo 2: 保存して終了^(これをせずに閉じるとhtmlファイルは完成しません^)

echo 3: 書き込み^(文字^)

echo 4: 書き込み^(URL^)

echo 5: 既定ブラウザで閲覧

echo 6: 描画設定

echo 7: アドオン

echo =======^> List EXIT ^<=======

echo.

set /p imput="Choose: "
echo.
if "%imput%" == "%randomcheck%" (goto editmain)
set choose=%imput%

if "%choose%" == "0" (goto dev0)
if "%choose%" == "1" (goto edit1)
if "%choose%" == "2" (goto edit2)
if "%choose%" == "3" (goto edit3)
if "%choose%" == "4" (goto edit4)
if "%choose%" == "5" (goto edit5)
if "%choose%" == "6" (goto edit6)
if "%choose%" == "7" (goto edit7)
goto editmain




:edit1
echo.
echo =======^> html Log ^<=======
type %filename%.html
echo =======^> Log EXIT^<=======
echo.
echo Press Any Key to continue
pause>>nul
goto editmain



:edit2
title Press Any Key to Exit
echo   ^</body^>>>%filename%.html
echo  ^<!--^<p^>%date:~0,4%/%date:~5,2%/%date:~8,2% %time:~0,2%:%time:~3,2%^</p^>--^>>>%filename%.html
echo ^</html^>>>%filename%.html
echo 正常に保存されました
echo Press Any Key to Exit
pause>>nul
exit



:edit3
set randomcheck=%random%
set imput=%randomcheck%
if "%cls%" == "t" (cls) else (echo.&echo.&echo.)

echo.
echo =======^> Color List ^<=======

echo 1        :赤色
echo 2        :青色
echo 3        :黄色
echo 4        :白色
echo 5        :緑色
echo それ以外 :必ず黒

echo =======^> List EXIT ^<=======
echo.

set /p imput="色を入力してください: "
echo.
if "%imput%" == "%randomcheck%" (goto edit3)
set color=%imput%

goto edit3w1

:edit3w1
set randomcheck=%random%
set imput=%randomcheck%
if "%cls%" == "t" (cls) else (echo.&echo.&echo.)
echo 文字列を入力してください
echo ※「"」,「<」などの記号を入力する場合、事前に「^」を入力してください
set /p imput=": "
echo.
if "%imput%" == "%randomcheck%" (goto edit3w1)
set write=%imput%
echo.
echo =======^> Color List ^<=======

echo 1        :赤色
echo 2        :青色
echo 3        :黄色
echo 4        :白色
echo 5        :緑色
echo それ以外 :必ず黒

echo =======^> List EXIT ^<=======
echo.
echo "%write%" を 色コード "%color%" で 書き込みます
echo.
goto edit3cho

:edit3cho
set randomcheck=%random%
set imput=%randomcheck%
set /p imput="Y/N: "
if "%imput%" == "Y" (goto edit3chok)
if "%imput%" == "y" (goto edit3chok)
if "%imput%" == "%randomcheck%" (goto edit3cho)
goto editmain


:edit3chok

set realcolor=black
if "%color%" == "1" (set realcolor=red)
if "%color%" == "2" (set realcolor=blue)
if "%color%" == "3" (set realcolor=yellow)
if "%color%" == "4" (set realcolor=white)
if "%color%" == "5" (set realcolor=lime)

echo    ^<p style="color:%realcolor%;"^> %write%^</p^>>>%filename%.html
goto editmain





:edit4
set randomcheck=%random%
set imput=%randomcheck%
if "%cls%" == "t" (cls) else (echo.&echo.&echo.)

echo URLを入力してください
set /p imput=": "
echo.
if "%imput%" == "%randomcheck%" (goto edit4)
set url=%imput%
echo.
goto edit4w1

:edit4w1
set imput=%url%
echo リンクにつける名前を入力してください
echo ※1「"」,「<」などの記号を入力する場合、事前に「^」を入力してください
echo ※2 空白の場合URL名が選ばれます
set /p imput=": "
set name=%imput%
echo.
echo "%url%" を "%name%" の 名称 で 書き込みます
goto edit4cho

:edit4cho
set randomcheck=%random%
set imput=%randomcheck%
set /p imput="Y/N: "
if "%imput%" == "Y" (goto edit4chok)
if "%imput%" == "y" (goto edit4chok)
if "%imput%" == "%randomcheck%" (goto edit4cho)
goto editmain

:edit4chok
echo     ^<a href="%url%"^> %name% ^</a^>>>%filename%.html
echo     ^<br^>>>%filename%.html
goto editmain



:edit5
start %filename%.html
goto editmain


:dev0
echo.
echo ==================================================
echo ^<Developer^>
echo.
echo Made by Umiirosoft
echo.
echo ==================================================
echo ^<Programming Details^>
echo.
echo プログラム言語: Windows bat
echo ビルドツール  : Build Tool:VisualBat ver 1.1.1
echo Language      : Windows bat
echo Build Tool    : VisualBat ver 1.1.1
echo.
echo ==================================================
echo ^<License^>
echo.
echo このバージョン "%vs%" は、製作者の許可がない限り再配布を禁じます
echo This version of "%vs%" may not be redistributed without
echo permission of the creator
echo.
echo ==================================================
echo.
echo Build: 2022/10/23
echo.
echo Press Any Key to contiune
pause>>nul
goto editmain

:edit6
echo.
echo.
echo =====^> 設定 Config ^<=====
echo.
echo 描画時にログを削除しますか?
echo Do you want to delete logs when drawing?
echo.
goto edit6c

:edit6c
set randomcheck=%random%
set imput=%randomcheck%
set /p imput="T/F: "
if "%imput%" == "T" (set cls=t
goto edit6ca)
if "%imput%" == "t" (set cls=t
goto edit6ca)
if "%imput%" == "%randomcheck%" (goto edit6c)
set cls=f
goto edit6ca

:edit6ca
echo.
echo 設定を更新しました
echo Updated settings
echo.
echo Press Any Key to continue
pause>>nul
echo.
goto editmain


:edit7
if "%cls%" == "t" (cls) else (echo.&echo.&echo.)

echo アドオンは信頼できるもののみを選択してください
echo Choose ONLY TRUSTED add-ons
echo.

if not exist "Addon" (
echo ^"Addon^"フォルダが見つかりません
echo ^"Addon^"Folder Not Found
echo.
echo Press Any Key to continue
pause>>nul
goto editmain
)

cd Addon
title Addon -
echo.
echo =====^> Addon List ^<=====
dir /b /p /w *.bat
echo.
echo =====^> List EXIT ^<=====
echo.
echo アドオン名を入力してください(.batは付けずに)
echo Enter the add-on name (without the .bat)
echo.
:edit7ch
set randomcheck=%random%
set imput=%randomcheck%
set /p imput="Addon Name: "

if "%imput%" == "%randomcheck%" (goto edit7ch)

if exist "%imput%.bat" (
echo.
echo call %imput%.bat...
echo.
call %imput%.bat
cd..
echo.
echo exit...
goto editmain
)
echo.
echo Addonが見つかりません
echo Addon Not Found
cd..
goto editmain