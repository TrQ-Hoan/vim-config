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
