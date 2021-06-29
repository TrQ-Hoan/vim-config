# Configure Neovim for C/C++ on Windows

## Install the [package manager for Windows](https://chocolatey.org/)
**You are using an administrative powershell**
```ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Install essential tools
**You are using an administrative powershell**

#### 0. Essential tools
```
choco install 7zip git fzf -y
```
#### 1. C/C++ Environment
```
choco intall msys2 nodejs llvm make python3 pip -y
```
Install neovim in pip:
```
pip install neovim
```
Install yarn in npm:
```
npm install -g yarn
```
You can install [gcc on msys2](https://github.com/orlp/dev-on-windows/wiki/Installing-GCC--&-MSYS2) or install [gcc multilib](https://sourceforge.net/projects/mingw-w64/files/Multilib%20Toolchains%28Targetting%20Win32%20and%20Win64%29/). **After install gcc, add path gcc to environment variable.**

#### 2. NeoVim
```
choco install neovim --pre -y
```


## Config [starship](https://starship.rs/) for git-bash and powershell

#### 1. Git-bash

**You are using an administrative git-bash**
```
mkdir -p -v /usr/local/bin
```
```shell
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```
Add starship to `~/.bashrc`:
```
eval "$(starship init bash)"
```

Add to [Windows Terminal](https://github.com/microsoft/terminal) with name "Bash":
```
C:\Program Files\Git\bin\bash.exe -l -i
```

#### 2. Powershell

**You are using an administrative powershell**
```
choco install starship -y
```
Open profile powershell:
```
notepad $profile
```
Add starship to powershell profile:
```
Invoke-Expression (&starship init powershell)
```
Add tools of msys2 to powershell. Add path environment variable: `C:\tools\msys64\usr\bin`

Creat short cut administrative [Windows Terminal](https://github.com/microsoft/terminal):
```
%SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -Command Start-Process -Verb RunAs cmd.exe '/c start wt.exe -p \"Windows PowerShell\"'
```

## Install other terminal emulator
#### Conemu
```
choco install conemu -y
```
Change `setting/starup/tasks` Git bash for admin `"-new_console:p"` to `"-new_console:a"`

#### Alacitty
```
choco install alacritty -y
```
Configure file: `%APPDATA%\alacritty\alacritty.yml`.
[Samples theme](https://github.com/aarowill/base16-alacritty/raw/master/colors/base16-oceanicnext-256.yml) | 
[Samples config](https://gitlab.com/dwt1/dotfiles/-/raw/master/.config/alacritty/alacritty.yml)

## Install Nerd Font
```
git clone https://github.com/powerline/fonts.git
```
```
cd fonts
```
```
Set-ExecutionPolicy RemoteSigned
```
```
.\install.ps1
```
