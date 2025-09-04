{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../specialisations/cybersecurity.nix
    ../specialisations/gaming.nix
    # ../specialisations/gns3.nix
    ../../modules/common/global_common.nix
  ];

  # nvidia settings
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    powerManagement.enable = true;

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    download-buffer-size = 524288000;
  };

  environment.systemPackages = with pkgs; [
    dbeaver-bin
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  
  networking = {
    hostName = "vortex"; # Define your hostname.

    firewall = {
      enable = true;
      allowPing = true;

      allowedTCPPorts = [2234];
    };

    # networking.hosts = {
    #   "10.129.54.100" = [ "unika.htb" ];
    # };

    # Enable networking
    networkmanager = {
      enable = true;
      dns = "none";
    };

    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];

    defaultGateway = "192.168.0.1";
    resolvconf.enable = false;
  };


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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ivan = {
    isNormalUser = true;
    description = "ivan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  services.displayManager.defaultSession = "hyprland";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    polarity = "dark";
    opacity = {
      applications = 1.0;
      desktop = 1.0;
      popups = 1.0;
      terminal = 1.0;
    };

    fonts = {
      serif = {
        package = pkgs.nerd-fonts.ubuntu;
        name = "Ubuntu Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.ubuntu-sans;
        name = "UbuntuSans Nerd Font";
      };

      monospace = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Terminus";
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

  fileSystems."/mnt/hdd" = {
    device = "UUID=55f7e3ef-3733-4772-99f3-aec2888b4c41";
    fsType = "ext4";
    options = [ "defaults" ];
  };

  swapDevices = [
    {
      device = "/mnt/hdd/swapfile";
      size = 16 * 1024; # 16 GB
    }
  ];

  stylix.targets.chromium.enable = false;

  system.stateVersion = "24.11"; # Did you read the comment?
}
