# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;

    firefox = {
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = true;
    };

    chromium = {
      enablePepperFlash = true;
      enablePepperPDF = true;
    };
  };

  # Booting
  boot.loader = {
    gummiboot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Internationalisation
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Time
  time.timeZone = "Europe/Amsterdam";

  # System packages
  environment.systemPackages = with pkgs; [
    # System
    wget
    zsh
    git
    tmux
    silver-searcher

    # Compiler
    gcc

    # Converters
    npm2nix

    # Web
    chromium
    firefox

    # Editor
    vim
    emacs

    # Social/chat
    weechat

    # Media
    vlc

    # Experiment
    syncthing
    dropbox
    stack
    terminator
  ];

  programs.zsh.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # GUI
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";

    desktopManager = {
      gnome3.enable = true;
    };

    windowManager = {
      default = "xmonad";
      xmonad.enable = true;
    };

    multitouch = {
      enable = true;
      invertScroll = true;
    };

    synaptics = {
      enable = true;
      twoFingerScroll = true;
    };

    videoDrivers = [ "noveau" ];
  };

  # Users
  users.extraUsers.yemi = 
    { description = "Yemi";
      isNormalUser = true;
      group = "users";
      uid = 1000;
      extraGroups = [ "wheel" "networkmanager" ];
      home = "/home/yemi";
      shell = "/run/current-system/sw/bin/zsh";
    };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";

}
