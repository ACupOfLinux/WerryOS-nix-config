

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos"; # Define your hostname.
 

  
 
  networking.networkmanager.enable = true;

  
  time.timeZone = "America/New_York";

  
  i18n.defaultLocale = "en_US.utf8";

  
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  
  users.users.werrynixs = {
    isNormalUser = true;
    description = "werry-nixs";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  
  nixpkgs.config.allowUnfree = true;

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  
  environment.systemPackages = with pkgs; [
    vim 
    wget
    neofetch
    git 
    kitty 
    picom
    gimp 
    polkit
    polybar
    rofi
    nitrogen
    doas 
    mangohud
    unzip
    nerdfonts
    pam
    elogind
    xfce.thunar
    sxhkd
    firefox
    zsh
  ];

  
   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

   services.openssh.enable = true;

  system.stateVersion = "22.05";


hardware.pulseaudio.enable = true;

services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;

hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;


}
