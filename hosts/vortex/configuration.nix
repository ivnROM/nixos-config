{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../specialisations/cybersecurity.nix
    ../specialisations/gaming.nix
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

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
    # packages = with pkgs; [];
  };

  services.displayManager.defaultSession = "hyprland";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  stylix = {
    enable = true;
    autoEnable = true;
    # da-one-ocean
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    polarity = "dark";
    opacity = {
      applications = 0.9;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9;
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
        name = "Iosevka Nerd Font";
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.

  # gns3 config

  # security.wrappers.ubridge = {
  #   source = "/run/current-system/sw/bin/ubridge";
  #   capabilities = "cap_net_admin,cap_net_raw=ep";
  #   owner = "root";
  #   group = "ubridge";
  #   permissions = "u+rx,g+rx,o+rx";
  # };
  # networking.bridges.gns3bridge.interfaces = [ "enp34s0" ];
  #
  # networking.interfaces.gns3bridge = {
  #   ipv4.addresses = [{
  #     address = "192.168.0.100";
  #     prefixLength = 24;
  #   }];
  # };

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

  system.stateVersion = "24.11"; # Did you read the comment?
}
