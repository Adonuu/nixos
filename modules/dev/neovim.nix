{ config, pkgs, ... }: {
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dotfiles/config/nvim";
    recursive = true;
  };

  home.packages = with pkgs; [
    go
    neovim
    nodejs
    unzip
  ];
}
