{ config, pkgs, ... }: {
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
