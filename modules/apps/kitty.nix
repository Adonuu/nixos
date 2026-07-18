{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      scrollback_lines = 10000;
      background_opacity = "0.95";
      window_padding_width = 12;
      enable_audio_bell = "no";
      update_check_interval = 0; # NixOS handles updates
      confirm_os_window_close = 0;
    };
  };
}
