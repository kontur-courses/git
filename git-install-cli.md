# Подготовка для варианта с Git Bash и Visual Studio Code

## Git

### Установка

Скачать [тут](https://git-scm.com/downloads)

Или через пакетные менеджеры: 
```
choco install git
sudo apt install git
brew install git
```

*Для Windows: в инсталляторе оставить все опции по умолчанию*

### Настройка

Нужно ввести следующие команды в терминале (для Windows — в Git Bash, CMD или PowerShell)

1. Настройка имени и почты пользователя. Эта информация будет прикрепляться к каждому коммиту.

   ```bash
   git config --global user.name "YOUR_NAME"
   git config --global user.email "your@email.com"
   ```

2. Настройка переносов строки.

   Для Windows:
   ```bash
   git config --global core.autocrlf true
   git config --global core.safecrlf true
   ```
   
   Для Linux и macOS:
   ```bash
   git config --global core.autocrlf input
   ```

3. (Опционально) Настрой редактор по умолчанию.
   Git будет открывать этот редактор, чтобы запрашивать имя коммита или сценарий для интерактивного rebase.
   Эти настройки будут применены для пользователя. В заданиях в любом случае будут использоваться notepad или nano за счет локальных настроек.

   Для Windows:
   ```bash
   git config --global core.editor notepad
   ```

   Для Linux и macOS:
   ```bash
   git config --global core.editor nano
   ```
   
   *Подробнее про символы переноса строк и зачем их конфигурировать можно прочитать [тут](https://htmlacademy.ru/blog/boost/tools/konec-stroki)*

## VS Code

1. VS Code можно взять здесь <https://code.visualstudio.com/Download>  
*Для Windows: в инсталляторе прожать все галочки в Other*
2. Git Graph - <https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph> (или найти в каталоге расширений в самом VS Code)
3. После установки Git Graph перезапусти VS Code
4. (Опционально) Включи автосохранение в VS Code — больше не придется нажимать `Ctrl/Cmd + S` после каждого изменения. Ставим галочку `Auto Save` в меню  `File`


## GitHub

[Заведи аккаунт на GitHub](https://github.com/join)


## SSH для GitHub (опционально)

1. Сгенерируй ssh-ключ. Для этого в терминале (на Windows исключительно в Git Bash) введи:

   `ssh-keygen -t rsa -b 4096`

   Оставь все опции по умолчанию (`Enter` после каждого вопроса)
   После этого в папке `.ssh` в домашней директории пользователя будет создано 2 файла: `id_rsa` и `id_rsa.pub`

2. Теперь нужно добавить содержимое `id_rsa.pub` на GitHub. Просмотреть его можно, например, с помощью VS Code.

   Команда для Git Bash: `code ~/.ssh/id_rsa.pub`
   Команда для CMD или PowerShell: `code %USERPROFILE%\.ssh\id_rsa.pub`

   Все содержимое файла нужно вставить на этой странице в поле "Key"

   <https://github.com/settings/ssh/new> 
   
   В поле "Title" можно написать что угодно, это просто название ssh-ключа.
   
   После этого нажми `Add SSH key` и ключ будет добавлен
