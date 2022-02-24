{ config, pkgs, libs, ... }:
{

  home.packages = with pkgs; [
    neovim
  ];

  xdg.configFile."nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink (config.home.homeDirectory + "/dotfiles/home-manager/configs/neovim/init.lua");
}
