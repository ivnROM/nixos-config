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
    brightnessctl
    dunst
    fastfetch
    ffmpeg
    gthumb
    hyprshot
    hyprsysteminfo
    libreoffice-qt6-fresh
    mpv
    nemo
    pavucontrol
    ripgrep
    stremio
    swww
    tree
    wofi

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
    EDITOR = "neovim";
    NIXOS_OZONE_WL = "1";
    HOSTNAME = "maelstrom";
    HYPRCURSOR_SIZE = "28";
    HYPRCURSOR_THEME = "Bibata-Original-Classic";
    HYPRSHOT_DIR = "${config.home.homeDirectory}/Pictures/Screenshots/";
    XCURSOR_SIZE = "28";
    XCURSOR_THEME = "Bibata-Original-Classic";
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
  programs.zed-editor.enable = true;

  services.ssh-agent.enable = true;
  services.dunst.enable = true;
  services.swww.enable = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
