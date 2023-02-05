@echo off

rem Frage den Benutzer nach der zu verschiebenden Datei
set /p sourceFile="Geben Sie den Pfad zur zu verschiebenden Datei an: "

rem Überprüfe, ob die angegebene Datei vorhanden ist
if not exist "%sourceFile%" (
  echo Die angegebene Datei %sourceFile% wurde nicht gefunden.
  pause
  exit /b
)

rem Definiere das Ziel-Laufwerk und den Ziel-Ordner
set targetDrive=D:
set targetFolder=Meine_Ablage

rem Überprüfe, ob das Ziel-Laufwerk vorhanden ist
if not exist %targetDrive% (
  echo Das Ziel-Laufwerk %targetDrive% ist nicht verfügbar.
  pause
  exit /b
)

rem Überprüfe, ob der Ziel-Ordner bereits auf dem Ziel-Laufwerk vorhanden ist
if not exist %targetDrive%\%targetFolder% (
  echo Der Ziel-Ordner %targetFolder% existiert nicht auf %targetDrive%. Er wird erstellt.
  mkdir %targetDrive%\%targetFolder%
)

rem Verschiebe die angegebene Datei in den Ziel-Ordner auf das Ziel-Laufwerk
move "%sourceFile%" "%targetDrive%\%targetFolder%\%~nx1"

echo Die Datei %sourceFile% wurde erfolgreich nach %targetDrive%\%targetFolder%\%~nx1 verschoben.
pause
