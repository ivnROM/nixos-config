{ config, pkgs, inputs, lib, ... }:

{

  imports = [
    ../../modules/default.nix
  ];

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    bluez
    brightnessctl
    fastfetch
    ffmpeg
    gthumb
    hyprshot
    hyprsysteminfo
    libnotify
    libreoffice-qt6-fresh
    mpv
    nemo
    pavucontrol
    pyprland
    qalculate-gtk
    ripgrep
    stremio
    swww
    tree
    yazi

    # lsp
    nixfmt-classic

    # temas
    nordzy-cursor-theme
    bibata-cursors
    
    # flake builds 
    inputs.zen-browser.packages.${pkgs.system}.default
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    HOSTNAME = "maelstrom";
    HYPRCURSOR_SIZE = "28";
    HYPRCURSOR_THEME = "Nordzy-hyprcursors";
    HYPRSHOT_DIR = "${config.home.homeDirectory}/Pictures/Screenshots/";
    XCURSOR_SIZE = "28";
    XCURSOR_THEME = "Nordzy-hyprcursors";
  };

  programs.zoxide.enable = true;
  programs.bash.enable = true;
  programs.neovim.enable = true;

  programs.git = {
    enable = true;
    userName = "ivan meyer";
    userEmail = "meyerivanoliver@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  programs.ssh.enable = true; 
  programs.mpv.enable = true; 

  services.ssh-agent.enable = true;
  services.swww.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
