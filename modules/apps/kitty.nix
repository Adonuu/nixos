{ config, pkgs, ... }: {

  xdg.configFile."kitty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dotfiles/config/kitty";
    recursive = true;
  };

  home.packages = [
    pkgs.kitty
  ];
}
