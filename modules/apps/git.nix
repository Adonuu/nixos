{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Adam Young";
        email = "adamyoung1414@gmail.com";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
