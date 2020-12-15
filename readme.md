# Vim config
[//]: # "https://github.com/fisadev/fisa-vim-config"

## Linux
**Use Vim**

0) You will need [Git] and Vim 8.0 or newer (`vim --version`).
<br> Also, your .vim folder should be empty. If you have one, rename it or move to a different location (to keep a backup, just in case you want to go back).
<br>

1) Intall [vim-plug] and remeber path of vim-plug.
<br>

2) Download the [config file](https://github.com/TrQ-Hoan/vim-config/blob/master/.vimrc) and save it as `~/.vimrc` (super important to use that exact name). Edit path vim-plug in your ~/.vimrc.
<br>

3) Open Vim and `:PlugInstall` it will continue the installation by itself. Wait for it to finish... and done! Quit and open vim agian, you now have your new shiny powerful Vim

## Windows
**Use NeoVim**

0) You will need [Git] and NeoVim 0.3 or newer (`nvim --version`). Which can be downloaded [here](https://github.com/neovim/neovim/releases).
<br> More info and alternative methods [here](https://github.com/neovim/neovim/wiki/Installing-Neovim).
<br> You can see [Tutorial](https://jdhao.github.io/2018/11/15/neovim_configuration_windows/).

[//]: # "Also, your `~/AppData/Local/nvim/` folder should be empty. If you have one, rename it or move to a different location (to keep a backup, just in case you want to go back)."

1) Intall [vim-plug] and remeber path of vim-plug.
<br>

2) Download the [config file](https://github.com/TrQ-Hoan/vim-config/blob/master/init.vim) and save it as `~/AppData/Local/nvim/init.vim`(or your path intall nvim, because this super important to use that exact path and name).
<br>

3) Open NeoVim and `:PlugInstall` it will continue the installation by itself. Wait for it to finish... and done! Quit and open vim agian, you now have your new shiny powerful NeoVim

[Git]: (https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
[vim-plug]: (https://github.com/junegunn/vim-plug)
