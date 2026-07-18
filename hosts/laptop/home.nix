# hosts/desktop/home.nix
{ config, pkgs, ... }: {

  # User Profile Environment Settings
  home.username = "adam";
  home.homeDirectory = "/home/adam";
  home.stateVersion = "26.05";

  imports = [
    ../../modules/apps/git.nix
    ../../modules/apps/vscode.nix
  ];

  # User-Specific Desktop Applications & Toolchains
  home.packages = with pkgs; [
    firefox
    alacritty

    # .NET Development
    dotnetCorePackages.sdk_10_0

    # C++ Development
    llvmPackages.llvm
    llvmPackages.clang
    cmake
    gnumake
  ];

  # Environment Variables
  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_10_0}";
  };
}
