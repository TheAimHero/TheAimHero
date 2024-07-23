# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./wm/xmonad
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "LaptopNix";
    networkmanager.enable = true;
    nameservers = [ "8.8.8.8" ];
    defaultGateway = "192.168.1.11";
  };


  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  # Enable the X11 windowing system.
  services = {
    displayManager = {
      sddm.enable = true;
    };
    xserver = {
      enable = true;

      xkb = {
        variant = "";
        layout = "us";
      };
      desktopManager.plasma5.enable = true;
    };
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };


  hardware = {
    pulseaudio.enable = false;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vedant = {
    isNormalUser = true;
    description = "Vedant";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ vscode kitty ripgrep fd go ];
  };

  # Install firefox.
  programs = {
    firefox.enable = true;
    zsh.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    git
    lf
    gcc
    xsel
    nodejs
    gnumake
    python3
    rustup
    unzip
    gzip
    wget
    sshfs
    go
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
