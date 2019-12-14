# Подготовка

## Git

### Установка

Гит можно взять тут: https://git-scm.com/downloads

Или через пакетные менеджеры: 
```
choco install git
sudo apt install git
brew install git
```
*Для Windows: в инсталляторе оставить все опции по умолчанию*

### Настройка

Нужно ввести следующие команды в терминале (для Windows - в Git Bash)

```bash
# Настройка имени и почты пользователя. Эта информация будет прикрепляться к каждому коммиту
git config --global user.name "YOUR_NAME"
git config --global user.email "your@email.com"

# Настройка переносов строки. Только для Windows
git config --global core.autocrlf true

# Настройка переносов строки. Только для Linux/Mac
git config --global core.autocrlf input
```



## VS Code 

VS Code - удобный текстовый редактор. В этом курсе будем использовать его вместе с расширением Git Graph

### Установка

1. VS Code можно взять здесь <https://code.visualstudio.com/Download>  
*Для Windows: в инсталляторе прожать все галочки в Other*
2. Git Graph - <https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph> (или найти в каталоге расширений в самом VS Code)

### Настройка

1. Включи автосохранение в VS Code - больше не придется нажимать `Ctrl/Cmd + S` после каждого изменения. Ставим галочку `Auto Save` в меню  `File`

2. Настрой VS Code как редактор по умолчанию для гита:

   В терминале (для Windows - в Git Bash):

   `code ~/.gitconfig`

   Откроется файл конфигурации гита в VS Code. Добавь в конец:

   ```
   [core]
   	editor = code --wait
   [merge]
   	tool = vscode
   [mergetool "vscode"]
   	cmd = code --wait $MERGED
   [diff]
   	tool = vscode
   [difftool "vscode"]
   	cmd = code --wait --diff $LOCAL $REMOTE
   ```

   

## GitHub

GitHub - хранилище git-репозиториев.

1. Заведи аккаунт на <https://github.com/> 

2. Сгенерируй ssh-ключ. Для этого в терминале (Git Bash на Windows) введи:

   `ssh-keygen -t rsa -b 4096`

   Оставь все опции по умолчанию (`Enter` после каждого вопроса)
   После этого в директории `~/.ssh` будет создано 2 файла: `id_rsa` и `id_rsa.pub`

3. Теперь нужно добавить содержимое `id_rsa.pub` на GitHub. Просмотреть его можно, например, открыв через VS Code: 

   `code ~/.ssh/id_rsa.pub`

   Его нужно вставить на этой странице в поле "Key"

   <https://github.com/settings/ssh/new> 
   
   В поле "Title" можно написать что угодно, это просто название ssh-ключа.
   
   После этого нажми `Add SSH key` и ключ будет добавлен
   

