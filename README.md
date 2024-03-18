# [NvChad v2.5](https://nvchad.com/)

## # uninstall

```shell
# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# Windows CMD
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data

# Window PowerShell
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data
```

## # install config

```shell
 git clone --branch=v2.5 https://github.com/ngtuonghy/nvchad_config --depth 1 ~/.config/nvim/ && nvim
```
