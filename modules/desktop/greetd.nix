{ config, lib, pkgs, ... }: {

  programs.regreet = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };

  services.dbus.enable = true;
  programs.dconf.enable = true;
  services.accounts-daemon.enable = true;

  environment.systemPackages = [
    pkgs.cage
    pkgs.regreet
    pkgs.adwaita-icon-theme
  ];
}
