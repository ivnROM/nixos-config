{ config, pkgs, input, ...}:
{

  imports = [
    ../programs/nvf.nix
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
    font-awesome
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-sans
  ];

  services.displayManager = {
    lemurs.enable = true;
  };

  # For lemurs
  users.users.ivan.extraGroups = [ "seat" ];
}
