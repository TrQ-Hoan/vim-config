# MacOS Mojave config

Setting keyboard Iterm2

`Preferences > Keys > General > Left Option key: Esc+`

`Preferences > Keys > Key Mappings > Presets... > Natural Text Editing`

Install essential
```
brew install wget npm yarn ccls fzf clang-format astyle nvim
```

Download lombok.jar
```
wget https://projectlombok.org/downloads/lombok.jar -O ~/.local/opt/lombok.jar
```

Clone config
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/init.vim --create-dirs \
         https://raw.githubusercontent.com/TrQ-Hoan/vim-config/master/neovim-mac/init.vim'
```

Install vim-plug
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Install coc tool. open nvim
```
:CocInstall coc-ccls
:CocInstall coc-java
:CocInstall coc-snippets
```

If jdt.ls not work, [download](https://download.eclipse.org/jdtls/milestones/?d) and repacle all data in `~/.config/coc/extensions/coc-java-data/server/`

Fix ccls `[coc.nvim] Unable to load global extension at /home/user/.config/coc/extensions/node_modules/coc-ccls: main file ./lib/extension.js`
```sh
cd ~/.config/coc/extensions/node_modules/coc-ccls
```
```
ln -s node_modules/ws/lib lib
```

Config coc-setting
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

