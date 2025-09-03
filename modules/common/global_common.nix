{ config, pkgs, input, ...}: let
  logo = pkgs.fetchurl {
    url = "https://nixos.org/logo/nixos-hires.png";
    sha256 = "1ivzgd7iz0i06y36p8m5w48fd8pjqwxhdaavc0pxs7w1g7mcy5si";
  };
in
{

  imports = [
    ../programs/nvf.nix
    # ../services/sddm.nix
  ];

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

  boot.plymouth = {
    enable = true;
    logo = logo;
  };

  stylix.targets = {
    font-packages.enable = true;
    console.enable = true;
    plymouth.enable = true;
  };

  # deshabilitar en caso de dejar de usar dolphin
  services.udisks2.enable = true;
}
