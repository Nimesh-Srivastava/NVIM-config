# NVIM Config

## Windows
Note : Zig compiler needs to be installed for tree-sitter to work properly. After that, parsers can be manually installed using ```:TSInstall <language>``` command.

### For native
Install nvim and place these contents in ```C: / Users / <Username> / Local / Appdata / nvim```

### For WSL
1) Open wsl 
```wsl```
2) Go to home dir 
```cd ~```
3) Go to *.config/*, if it does not exist, create it 
```
mkdir .config 
cd .config
``` 
4) Create nvim dir inside .config 
```mkdir nvim```


## MacOS
Note : MacOS default terminal does not support colors and nerd-fonts. It is better to use another terminal emulator like iTerm2.

### Installation
1) Ensure installation of node and npm
2) Use HomeBrew to install neovim : `brew install neovim`
3) In the root dir, create `.config` if it doesn't exist
4) Inside `.config`, create `nvim` dir
5) Copy the contents of this repo into the `nvim` dir
6) Remove the zig compiler line from `lua/plugins/treesitter.lua`
7) Save file, restart the terminal
