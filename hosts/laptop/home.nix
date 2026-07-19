{ config, pkgs, ... }: {

  home.username = "adam";
  home.homeDirectory = "/home/adam";
  home.stateVersion = "26.05";

  imports = [
    ../../modules/apps/git.nix
    ../../modules/apps/kitty.nix
    ../../modules/apps/parsec.nix
    ../../modules/apps/vscode.nix
    ../../modules/dev/cpp.nix
    ../../modules/dev/dotnet.nix
  ];

  home.packages = with pkgs; [
    firefox
  ];
}
