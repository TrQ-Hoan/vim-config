# MacOS Mojave config

Install essential
```
brew install npm yarn ccls clang-format nvim
```

Clone config
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/init.vim --create-dirs \
         https://raw.githubusercontent.com/TrQ-Hoan/vim-config/master/neovim-mac/init.vim'
```

Install Plugin
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Install coc-ccls, open nvim
```
:CocInstall coc-ccls
```

Fix ccls `[coc.nvim] Unable to load global extension at /home/user/.config/coc/extensions/node_modules/coc-ccls: main file ./lib/extension.js`
```sh
cd ~/.config/coc/extensions/node_modules/coc-ccls
```
```
ln -s node_modules/ws/lib lib
```

Config coc-ccls
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/coc-settings.json --create-dirs \
           https://raw.githubusercontent.com/TrQ-Hoan/vim-config/master/neovim-mac/coc-settings.json'
```

Add `.ccls` in your dir workspace
```
clang
-std=c++17
-stdlib=libc++
-isystem/usr/local/include
-isystem/Library/Developer/CommandLineTools/usr/bin/../include/c++/v1
-isystem/Library/Developer/CommandLineTools/usr/lib/clang/10.0.1/include
-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/usr/include
-isystem/Library/Developer/CommandLineTools/usr/include
```

