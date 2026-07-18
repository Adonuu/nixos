{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    dotnetCorePackages.sdk_10_0
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_10_0}";
  };
}
