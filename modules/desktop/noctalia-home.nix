{ config, lib, ... }: {

  xdg.configFile."noctalia" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dotfiles/config/noctalia";
    recursive = true;
  };
}
