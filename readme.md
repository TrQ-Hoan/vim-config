# Vim config
[//]: # "https://github.com/fisadev/fisa-vim-config"

## Linux
**Use Vim**

0) You will need [Git] and Vim 8.0 or newer (`vim --version`).
<br> Also, your `.vim/` folder should be empty. If you have one, rename it or move to a different location (to keep a backup, just in case you want to go back).

1) Intall [vim-plug] and remeber path of vim-plug.

2) Download the [config file](https://github.com/TrQ-Hoan/vim-config/blob/master/.vimrc) and save it as `~/.vimrc` (super important to use that exact name). Edit path vim-plug in your `~/.vimrc`.

3) Open Vim and `:PlugInstall` it will continue the installation by itself. Wait for it to finish... and done! Quit and open vim agian, you now have your new shiny powerful Vim

> [Script](./neovim-voidlinux-cpp/iosevka_install) install font Iosevka

## Windows
**Use NeoVim**

0) [Install NeoVim](https://github.com/TrQ-Hoan/vim-config/blob/master/neovim-windows-cpp/README.md)

1) Intall [vim-plug] and remeber path of vim-plug.

2) Download the [config file](https://github.com/TrQ-Hoan/vim-config/blob/master/neovim-windows-cpp/init.vim) and save it as `~/AppData/Local/nvim/init.vim`(or your path intall nvim, because this **important** to use that exact path and name). Edit path vim-plug in your `init.vim`.

3) Use [coc-setting](https://github.com/TrQ-Hoan/vim-config/blob/master/neovim-windows-cpp/coc-settings.json) on `:CocConfig`

4) Download [compile_flags](https://github.com/TrQ-Hoan/vim-config/blob/master/neovim-windows-cpp/compile_flags.txt) to the directory your code. This help you not get error not found base lib (stdio.h, iostream)

4) Open NeoVim and `:PlugInstall` it will continue the installation by itself. Wait for it to finish... and done! Quit and open vim agian, you now have your new shiny powerful NeoVim


[Git]: <https://git-scm.com/book/en/v2/Getting-Started-Installing-Git>
[vim-plug]: <https://github.com/junegunn/vim-plug>
