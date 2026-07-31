{ config, pkgs, inputs, ... }: {

  home.username = "adam";
  home.homeDirectory = "/home/adam";
  home.stateVersion = "26.05";

  imports = [
    ../../modules/apps/git.nix
    ../../modules/apps/kitty.nix
    ../../modules/apps/vscode.nix
    ../../modules/desktop/hyprland-home.nix
    ../../modules/desktop/noctalia-home.nix
    ../../modules/dev/cpp.nix
    ../../modules/dev/dotnet.nix
  ];

  home.packages = with pkgs; [
    firefox
    brightnessctl
  ];
}
