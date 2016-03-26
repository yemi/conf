# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the gummiboot efi boot loader.
  boot.loader.gummiboot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel modules
  boot.kernelModules = ["applesmc"];

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nixpkgs.config.allowUnfree = true;

  # Internationalisation properties
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Time zone
  time.timeZone = "Europe/Amsterdam";

  # Installed packages in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    zsh
    wget
    firefox
    chromium
    emacs
    git
    weechat
    gcc
    ghc
    stack
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Video drivers
  services.xserver.videoDrivers = ["noveau"];

  # GUI
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.windowManager.xmonad.enable = true;

  # Enable touchpad
  services.xserver.synaptics.enable = true;
  services.xserver.synaptics.twoFingerScroll = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";

  # User management
  users.extraUsers.yemi =
    { isNormalUser = true;      
      home = "/home/yemi";
      extraGroups = ["wheel" "networkmanager"];
      description = "Yemi Tabaniz";
    };
}
