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
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "1:web" = "";
            "2:code" = "";
            "3:term" = "";
            "4:work" = "";
            "5:music" = "";
            "6:docs" = "";
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

