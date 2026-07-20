{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop/plasma.nix
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/noctalia.nix
    ../../modules/desktop/sddm.nix
    ../../modules/core/maintenance.nix
    ../../modules/core/ssh.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "adamlaptop";
  networking.networkmanager.enable = true; # Keeps your current network manager active

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  time.timeZone = "America/Chicago";

  users.users.adam = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    tree
  ];

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false; # Set to false to avoid sleep issues
    powerManagement.finegrained = false; # Must be false (GTX 1060 does not support this)
    open = false; # Must be false (Nvidia open drivers require Turing or newer)
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580; #1080 is only supported up to 580 driver

    nvidiaSettings = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  system.stateVersion = "26.05";
}
