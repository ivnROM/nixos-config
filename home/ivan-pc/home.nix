{ config, pkgs, inputs, lib, ... }:
{

  imports = [
    ../../modules/default.nix
  ];

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";

  home.stateVersion = "24.11"; 

  home.packages = with pkgs; [
    kdePackages.ark
    kdePackages.dolphin

    brightnessctl
    cliphist
    fastfetch
    ffmpeg
    fzf
    gthumb
    hyprshot
    hyprsysteminfo
    libnotify
    pavucontrol
    pyprland
    qalculate-gtk
    quickshell
    ripgrep
    swww
    tree

    # lsp
    nixfmt-classic
    
    # flake builds 
    inputs.zen-browser.packages.${pkgs.system}.default
  ];

  home.file = {};

  home.pointerCursor = 
    let
      getFrom = url: hash: name: {
        gtk.enable = true;
        x11.enable = true;
        name = name;
        size = 48;
        package = 
          pkgs.runCommand "moveUp" {} ''
            mkdir -p $out/share/icons
            ln -s ${pkgs.fetchzip {
              url = url;
              hash = hash;
            }} $out/share/icons/${name}
          '';
      };
    in 
      getFrom
      "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Classic.tar.xz"
      "sha256-2Fd0OVSCgFZVLRAVo/MxgHp1qK5WUNhKY685XPYrBmk="
      "Bibata-Modern-Classic";


  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    HOSTNAME = "vortex";
    HYPRCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRSHOT_DIR = "${config.home.homeDirectory}/Pictures/Screenshots/";
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Bibata-Modern-Classic";
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
        file_manager = "${pkgs.kdePackages.dolphin}/bin/dolphin";
      };
    };
  };

  stylix.targets.vesktop.enable = false;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
