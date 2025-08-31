{ config, pkgs, inputs, lib, ... }:
let
  editor = config.home.sessionVariables.EDITOR;
in
{
  home.packages = with pkgs; [
    bat
    brightnessctl
    btop
    cliphist
    eza
    fastfetch
    ffmpeg
    fzf
    hyprshot
    hyprsysteminfo
    libnotify
    nerd-font-patcher
    nicotine-plus
    kdePackages.okular
    pavucontrol
    pyprland
    qalculate-gtk
    ripgrep
    tldr

    # lsp
    nixfmt-classic

    # scripts
    (pkgs.writeShellScriptBin "create-note" ''
      filename="$(date +%F).md"
      command="${editor} ${config.home.homeDirectory}/Notes/$filename"
      mkdir -p "${config.home.homeDirectory}/Notes"

      if [ -n "$TMUX" ]; then
        tmux send-keys "$command" C-m
      else
        eval "$command"
      fi
    '')
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

  home.shell.enableBashIntegration = true;
  home.shellAliases = {
    "l" = "eza -lah";
    "ls" = "eza";
    "tree" = "eza --tree --git-ignore";
    "cat" = "bat";

    "nr" = "nh os switch";
    "cg" = "sudo nix-collect-garbage -d";

    "gen-pythondev" = "cp /etc/nixos/templates/dev-python/flake.nix .";
  };

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

  programs.thunderbird = {
    enable = true;
    profiles = {
      ivan = {
        isDefault = true;
        search.default = "ddg";
      };
    };
  };

  programs.zoxide.enable = true;
  programs.bash.enable = true;
  programs.neovim.enable = true;
  programs.hyprlock.enable = true;
  programs.rmpc.enable = true;
  programs.ssh.enable = true; 
  programs.mpv.enable = true; 

  services.ssh-agent.enable = true;

  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/hdd/Music/";
    extraConfig = ''
      audio_output {
        type "pulse"
        name "Pulseaudio"
      }
    '';
  };

  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.kdePackages.dolphin}/bin/dolphin";
      };
    };
  };
}
