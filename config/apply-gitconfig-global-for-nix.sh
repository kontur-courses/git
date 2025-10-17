#!/bin/bash

git config --global core.editor nano


git config --global difftool.vscode.path = code
git config --global difftool.vscode.cmd = code --wait --diff $LOCAL $REMOTE

git config --global mergetool.vscode.path = code
git config --global mergetool.vscode.cmd = code --wait $MERGED


git config --global merge.tool vscode
git config --global merge.guitool vscode
git config --global mergetool.keepbackup false
git config --global diff.tool vscode
git config --global diff.guitool vscode

git config --global core.autocrlf input
git config --global pull.ff only
git config --global pull.rebase false
git config --global fetch.prune false
git config --global rebase.autostash false

git config --global credential.helper manager


git config --global alias.configure "config --global -e"

git config --global alias.cleanup "clean -xdf"

git config --global alias.cm "commit -m"
git config --global alias.call "!git add --all && git commit"
git config --global alias.calm "!git add --all && git commit -m"
git config --global alias.amend "git commit --amend --no-edit"

git config --global alias.st "status -sb"

git config --global alias.gr "log --graph"
git config --global alias.gra "log --graph --all"
git config --global alias.graph "log --graph --oneline --decorate --all"
git config --global alias.grr "log --graph --all --reflog"

git config --global alias.br "branch -vv --sort=-committerdate --list"

git config --global alias.co "checkout"
git config --global alias.cob "checkout -b"
git config --global alias.sw "switch"
git config --global alias.swc "switch -c"
git config --global alias.back "checkout -"

git config --global alias.undo "reset --soft HEAD^"
git config --global alias.forget "reset --hard HEAD^"
git config --global alias.restart "reset --hard @{u}"

git config --global alias.merc "merge --no-ff"
git config --global alias.ff "merge --ff-only FETCH_HEAD"

git config --global alias.autorebase "rebase --autostash"
git config --global alias.rr "rebase --autostash FETCH_HEAD"

git config --global alias.pushup "push -u origin HEAD"
git config --global alias.please "push --force-with-lease"
git config --global alias.puff "pull --ff-only"
git config --global alias.purr "pull --rebase --autostash"
git config --global alias.sync "!git pull --rebase --autostash && git push"


GitUserEmail=$(git config --get user.email)
if [[ "$GitUserEmail" == "" ]]; then
    echo "Configure `git config --global user.email`!"
fi
GitUserName=$(git config --get user.name)
if [[ "$GitUserName" == "" ]]; then
    echo "Configure `git config --global user.name`!"
fi

echo "Configuration is done"
sleep 3
