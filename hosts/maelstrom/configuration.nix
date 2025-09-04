# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../specialisations/cybersecurity.nix
      ../../modules/programs/nvf.nix
      ../../modules/common/global_common.nix

    ];

  # Bootloader.
  stylix.targets.grub.enable = true;
  boot.loader = {
    # systemd-boot.enable = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";  
    };
    efi.canTouchEfiVariables = true;
    timeout = lib.mkForce 10;
  };
  

  networking.hostName = "maelstrom"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Argentina/Buenos_Aires";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_AR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };

  services.displayManager.defaultSession = "hyprland";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  services.logind = {
    powerKey = "ignore";
    #rebootKey = "ignore";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ivan = {
    isNormalUser = true;
    description = "ivan";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd"];
    home = "/home/ivan";
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # gns3 
    dnsmasq
    gns3-server
    gns3-gui
    ubridge
    qemu

    dbeaver-bin
    inetutils
    wl-clipboard
    xclip
    wget
  ];


  stylix = { 
    enable = true;
    autoEnable = true;
    # tokyo night
    base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-dark.yaml";

    polarity = "dark";
    opacity = {
      applications = 0.9;
      desktop = 0.9;
      popups = 1.0;
      terminal = 1.0; 
    };

    fonts = {
      serif = {
        # package = pkgs.nerd-fonts.ubuntu;
        package = pkgs.ibm-plex;
        name = "IBM Plex Serif";
      };

      sansSerif = {
        # package = pkgs.nerd-fonts.ubuntu-sans;
        package = pkgs.ibm-plex;
        name = "IBM Plex Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.ubuntu;
        name = "UbuntuSansMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos";
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
  };

  services.mysql = {
    enable = true;
    package = pkgs.mysql84;
    settings = {
      mysqld = {
        port = 4321;
        bind-address = "127.0.0.1";
      };
    };
  };
 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  #programs.hyprland.enable = true;
  #virtualisation.docker.enable = true;

  # List services that you want to enable:
  services.tlp.enable = true;
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  #
  security.wrappers.ubridge = {
    source = "${pkgs.ubridge}/bin/ubridge";
    capabilities = "cap_net_admin,cap_net_raw=ep";
    owner = "root";
    group = "ubridge";
    permissions = "u+rx,g+rx,o+rx";
  };

  users.groups.ubridge = {};
  users.groups.gns3 = {};

  virtualisation.libvirtd = {
  enable = true;
  qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    swtpm.enable = true;
    ovmf = {
      enable = true;
      packages = [(pkgs.OVMF.override {
        secureBoot = true;
        tpmSupport = true;
      }).fd];
    };
  };
};

  networking.firewall = {
    enable = false;
    allowPing = true;
    allowedTCPPorts = [ 3080 ];
    trustedInterfaces = [ "virbr0"];
  };

  system.stateVersion = "24.11"; 

}
