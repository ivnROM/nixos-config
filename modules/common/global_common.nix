{
  config,
  pkgs,
  input,
  ...
}:
let
  nixos_logo = pkgs.fetchurl {
    url = "https://github.com/homarr-labs/dashboard-icons/blob/main/png/nixos.png?raw=true";
    sha256 = "IM+VMjejwv0CJ5MMixAWXPHL9aNMwx+K4Nfy1opXOHY=";
  };
in
{

  imports = [
    ../programs/nvf.nix
    # ../services/sddm.nix
  ];

  boot = {
    plymouth = {
      enable = true;
      logo = nixos_logo;
      extraConfig = ''

        [Daemon]
        DeviceScale=2
      '';
    };

    # cambiar para ver las entradas del bootloader
    initrd.verbose = false;
    loader.timeout = 0;
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    inetutils
    gcc
    gnumake
    wget

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
    cozette
    ibm-plex

    font-awesome
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-sans
    nerd-fonts.terminess-ttf
  ];

  services.displayManager = {
    # lemurs.enable = true;
    ly.enable = true;
  };

  stylix.targets = {
    font-packages.enable = true;
    console.enable = true;
    plymouth.enable = true;
  };

  # deshabilitar en caso de dejar de usar dolphin
  services.udisks2.enable = true;
}
