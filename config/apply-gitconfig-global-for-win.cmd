@echo off

set GIT=git

%GIT% --help > nul

if %errorlevel% neq 0 (
    set GIT="%ProgramFiles%\Git\bin\gi.exe"
)

%GIT% --help > nul

if %errorlevel% neq 0 (
    color 0c
	echo.
	echo.
	echo "Git is not configured properly... Ask for help!"
    pause
	exit
)

REM setting editor for commits
%GIT% config --global core.editor notepad

REM setting up absolute path to visual studio code
if exist "%ProgramFiles(x86)%\Microsoft VS Code\Code.exe" (
    %GIT% config --global difftool.vscode.path "%ProgramFiles(x86)%\Microsoft VS Code\Code.exe"
	%GIT% config --global difftool.vscode.cmd "%ProgramFiles(x86)%\Microsoft VS Code\Code.exe --wait --diff $LOCAL $REMOTE"
    %GIT% config --global mergetool.vscode.path "%ProgramFiles(x86)%\Microsoft VS Code\Code.exe"
	%GIT% config --global mergetool.vscode.cmd "%ProgramFiles(x86)%\Programs\Microsoft VS Code\Code.exe --wait $MERGED"
)
if exist "%ProgramFiles%\Microsoft VS Code\Code.exe" (
    %GIT% config --global difftool.vscode.path "%ProgramFiles%\Microsoft VS Code\Code.exe"
	%GIT% config --global difftool.vscode.cmd "%ProgramFiles%\Microsoft VS Code\Code.exe --wait --diff $LOCAL $REMOTE"
    %GIT% config --global mergetool.vscode.path "%ProgramFiles%\Microsoft VS Code\Code.exe"
	%GIT% config --global mergetool.vscode.cmd "%ProgramFiles%\Programs\Microsoft VS Code\Code.exe --wait $MERGED"
)
if exist "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe" (
    %GIT% config --global difftool.vscode.path "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe"
	%GIT% config --global difftool.vscode.cmd "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe --wait --diff $LOCAL $REMOTE"
    %GIT% config --global mergetool.vscode.path "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe"
	%GIT% config --global mergetool.vscode.cmd "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe --wait $MERGED"
)

REM good config
%GIT% config --global merge.tool vscode
%GIT% config --global merge.guitool vscode
%GIT% config --global mergetool.keepbackup false
%GIT% config --global diff.tool vscode
%GIT% config --global diff.guitool vscode

%GIT% config --global core.autocrlf true
%GIT% config --global pull.ff only
%GIT% config --global pull.rebase false
%GIT% config --global fetch.prune false
%GIT% config --global rebase.autostash false

%GIT% config --global credential.helper manager

REM aliases
%GIT% config --global alias.it "!git init && git commit -m 'Initial commit' --allow-empty"
%GIT% config --global alias.st "status -sb"
%GIT% config --global alias.call "!git add . && git commit -m"
%GIT% config --global alias.commend "commit --amend --no-edit"
%GIT% config --global alias.graph "log --oneline --decorate --graph --all"
%GIT% config --global alias.to "checkout"
%GIT% config --global alias.pushup "push -u origin HEAD"
%GIT% config --global alias.please "push --force-with-lease"
%GIT% config --global alias.puff "pull --ff-only"
%GIT% config --global alias.pure "pull --rebase --autostash"
%GIT% config --global alias.purr "pull --rebase --autostash"
%GIT% config --global alias.undo "reset --soft HEAD^"


for /f %%i in ('git config --get user.email') do set GitUserEmail=%%i

if [%GitUserEmail%] == [] (
    echo "Configure `git config --global user.email`!"
)

for /f %%i in ('git config --get user.name') do set GitUserName=%%i

if [%GitUserName%] == [] (
    echo "Configure `git config --global user.name`!"
)

echo Configuration is done
pause
