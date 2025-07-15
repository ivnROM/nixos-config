# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/programs/nvf.nix
      ./../specialisations/cybersecurity.nix
    ];

  # nvidia settings
  hardware.graphics = {
    enable = true;
  }; 

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    powerManagement.enable = true;

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };


  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    download-buffer-size = 524288000;
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "vortex"; # Define your hostname.
  networking.firewall = {
    enable = true;
    allowPing = true;
  };

  # networking.hosts = {
  #   "10.129.54.100" = [ "unika.htb" ];
  # };


  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager = {
    enable = true;
    dns = "none";
  };

  networking.nameservers = [ "1.1.1.1" "8.8.8.8"];
  networking.defaultGateway = "192.168.0.1";
  networking.resolvconf.enable = false;

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
    options = "caps:escape";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ivan = {
    isNormalUser = true;
    description = "ivan";
    extraGroups = [ "networkmanager" "wheel" "ubridge" "gns3"];
    packages = with pkgs; [];
  };
  services.displayManager = {
    ly = {
      enable = true;
    };
  };
  services.displayManager.defaultSession = "hyprland";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    inetutils
    gcc
    gnumake

    lshw
    git  
    wl-clipboard
    xclip
    #  wget


    #manual
    linux-manual
    man-pages
    man-pages-posix
    # gns3-server
    # gns3-gui
    # ubridge
    # qemu

    python3
    python313Packages.pydbus
  ];

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    font-awesome
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-sans
  ];

  stylix = { 
    enable = true;
    autoEnable = true;
    # tokyo city terminal dark
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-terminal-dark.yaml";
    # sandcastle
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/sandcastle.yaml";
    # gruvbox
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";

    # tokyo night
    #image = ../../assets/wallpaper.png;
    # gruvbox
    #image = ../../assets/gruvbox.png;

    polarity = "dark";
    opacity = {
      applications = 0.9;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9; 
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
