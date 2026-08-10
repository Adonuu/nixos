{ config, pkgs, ... }:

{
  programs.opencode = {
    enable = true;
    
    settings = {
      autoupdate = false;
      autoshare = false;
    };
  };
}
