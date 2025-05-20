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

        modules-left = [ "hyprland/workspaces" "sway/mode" "custom/spotify" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "pulseaudio" "network" "cpu" "memory" "battery" "tray" "clock" ];

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

        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
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
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          format-disconnected = "Disconnected ⚠";
          on-click = "kitty nmtui";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
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
      }
    ];
  };
}

