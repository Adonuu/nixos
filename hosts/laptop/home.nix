# hosts/desktop/home.nix
{ config, pkgs, ... }: {

  # User Profile Environment Settings
  home.username = "adam";
  home.homeDirectory = "/home/adam";
  home.stateVersion = "26.05";

  imports = [
    ../../modules/apps/git.nix
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

  # VSCode Configuration
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions = (with pkgs.vscode-extensions; [
        ms-vscode.cpptools
        ms-vscode.cpptools-extension-pack
        ms-dotnettools.csharp
      ]) ++ [
        (pkgs.vscode-utils.extensionFromVscodeMarketplace {
          name = "theme-monokai-pro-vscode";
          publisher = "monokai";
          version = "1.1.21";
          sha256 = "sha256-ZFIILLY88b25QuJBlAPWIFqbA+c/sxdfaDc1Mbyy/5o=";
        })
      ];

      userSettings = {
        "telemetry.telemetryLevel" = "off";
        "workbench.colorTheme" = "Monokai Pro";
        "workbench.iconTheme" = "monokai-pro-icons";
      };
    };
  };
}
