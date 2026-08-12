{ config, lib, pkgs, ... }: {

  dconf.enable = true;
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  xdg.configFile."hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dotfiles/config/hypr";
    recursive = true;
  };

  xdg.configFile."kdeglobals" = {
    text = ''
      [Icons]
      Theme=breeze-dark

      [UiSettings]
      ColorScheme=BreezeDark

      [Colors:View]
      BackgroundAlternate=29,31,34
      BackgroundNormal=20,22,24
      DecorationFocus=61,174,233
      DecorationHover=61,174,233
      ForegroundActive=61,174,233
      ForegroundInactive=161,169,177
      ForegroundLink=29,153,243
      ForegroundNegative=218,68,83
      ForegroundNeutral=246,116,0
      ForegroundNormal=252,252,252
      ForegroundPositive=39,174,96
      ForegroundVisited=155,89,182
    '';
  };

  xdg.dataFile."color-schemes" = {
    source = "${pkgs.kdePackages.breeze}/share/color-schemes";
  };

  home.packages = with pkgs; [
    hyprlock
    hypridle
    hyprpicker
    kdePackages.dolphin
    kdePackages.breeze
    kdePackages.plasma-integration
  ];
}
