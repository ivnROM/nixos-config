{ config, pkgs, inputs, lib, ... }:
{

  imports = [
    ../../modules/default.nix
  ];

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";

  home.stateVersion = "24.11"; 

  home.packages = with pkgs; [
    brightnessctl
    fastfetch
    ffmpeg
    gimp3
    gthumb
    hyprshot
    hyprsysteminfo
    libnotify
    nemo
    pavucontrol
    pyprland
    qalculate-gtk
    quickshell
    ripgrep
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
    HOSTNAME = "vortex";
    HYPRCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Nordzy-hyprcursors-catppuccin-macchiato-dark";
    HYPRSHOT_DIR = "${config.home.homeDirectory}/Pictures/Screenshots/";
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Nordzy-catppuccin-macchiato-dark";
  };

  stylix.targets = {
    gtk.enable = true;
    qt.enable = true;
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

  programs.vesktop.enable = true;
  programs.ssh.enable = true; 
  programs.mpv.enable = true; 

  services.ssh-agent.enable = true;
  services.swww.enable = true;

  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.nemo}/bin/nemo";
      };
    };
  };

  stylix.targets.vesktop.enable = false;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
