{ pkgs, config, lib, ... }:

{
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 36;

        modules-left = [ "custom/separator" "custom/logo" "custom/spotify" "tray"];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "pulseaudio" "custom/separator" "battery" "custom/separator"  "network" "custom/separator"  "clock" "custom/separator"];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            urgent = "";
            focused = "";
            default = "";
          };
        };

        tray = {
          spacing = 10;
        };

        clock = {
          format-alt = "{:%Y-%m-%d}";
          timezone = "America/Argentina/Buenos_Aires";
        };

        cpu = {
          format = "{usage}% ";
        };

        memory = {
          format = "{}% ";
        };

        battery = {
          bat = "BAT0";
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        network = {
          format-wifi = "";
          format-ethernet = "󰈀";
          format-disconnected = "⚠";
          on-click = "kitty nmtui";
        };

        pulseaudio = {
          format = "{icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" ];
          };
          on-click = "pavucontrol";
        };

        "custom/spotify" = {
          format = " {}";
          max-length = 40;
          interval = 30;
          exec = "$HOME/.config/waybar/mediaplayer.sh 2> /dev/null";
          exec-if = "pgrep spotify";
        };

        "custom/separator" = {
          format = "  ";
        };

        "custom/logo" = {
          format = "  ";
          on-click = "pkill hyprsysteminfo || hyprsysteminfo";
        };

      }
    ];
  };
}

