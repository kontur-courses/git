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


git config --global alias.it "!git init && git commit -m 'Initial commit' --allow-empty"
git config --global alias.st "status -sb"
git config --global alias.call "!git add . && git commit -m"
git config --global alias.commend "commit --amend --no-edit"
git config --global alias.graph "log --oneline --decorate --graph --all"
git config --global alias.to "checkout"
git config --global alias.pushup "push -u origin HEAD"
git config --global alias.please "push --force-with-lease"
git config --global alias.puff "pull --ff-only"
git config --global alias.pure "pull --rebase --autostash"
git config --global alias.purr "pull --rebase --autostash"
git config --global alias.undo "reset --soft HEAD^"


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
