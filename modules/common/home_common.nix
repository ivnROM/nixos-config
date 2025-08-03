{ config, pkgs, inputs, lib, ... }:
{
  home.packages = with pkgs; [
    kdePackages.ark
    kdePackages.dolphin

    brightnessctl
    btop
    cliphist
    fastfetch
    ffmpeg
    fzf
    hyprshot
    hyprsysteminfo
    libnotify
    pavucontrol
    pyprland
    qalculate-gtk
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

  stylix.targets = {
    gtk.enable = true;
    qt.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "ivan meyer";
    userEmail = "meyerivanoliver@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  programs.zoxide.enable = true;
  programs.bash.enable = true;
  programs.neovim.enable = true;
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
}
