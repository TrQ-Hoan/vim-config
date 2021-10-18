# [Void Linux WSL](https://github.com/am11/VoidWSL)

Update
```
xbps-install -Su
```

Install essential
```
xbps-install -Sy neovim exa curl git fzf fish-shell nodejs base-devel gcc cmake make clang llvm astyle
```
Add user
```
useradd donald
```

Change password
```
passwd donald
```

Add sudo for user
```
usermod -aG wheel donald
```

Clone config
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/init.vim --create-dirs \
         https://raw.githubusercontent.com/TrQ-Hoan/vim-config/master/neovim-voidlinux-cpp/init.vim'
```
