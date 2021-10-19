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

Install coc tool. open nvim
```
:CocInstall coc-clangd
```

Astyle config `~/.astylerc`
```
--style=google
--indent=spaces=4
--indent-preprocessor
--pad-oper
--pad-header
--max-instatement-indent=40
--align-pointer=name
--align-reference=name
--keep-one-line-statements
--convert-tabs
--max-code-length=79
--pad-method-colon=none
```
