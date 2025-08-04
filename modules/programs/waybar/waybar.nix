{ pkgs, config, lib, ... }: let 
  waybarConfigPath = "${config.home.homeDirectory}/TempDotfiles/waybar/config.jsonc";
in
  {
  stylix.targets.waybar = {
    enable = true;
    addCss = false;
  };

  home = {
    file = {
      ".config/waybar/config.jsonc".source = config.lib.file.mkOutOfStoreSymlink waybarConfigPath;
    };
  };

  programs.waybar = {
    enable = true;

    style = ''
    * {
        border: none;
        border-radius: 0rem;
        padding: 0.1rem;
        min-height: 14px;
    }

    #window {
        font-weight: bold;
        padding: 4px 6px;
        /* background-color: rgba(0, 0, 0, 0);*/
        background-color: rgba(0, 0, 0, 255);
        border-radius: 10px;
        margin-top: 6px;
        margin-left: 6px;
        margin-right: 6px;
        border-width: 0px;
    }

    window#waybar {
        /*background: transparent;*/
        background-color: transparent;
        color: white;
        border: none;
    }

    window#waybar.empty #window {
        background-color: transparent;
    }

    #workspaces {
        /* padding: 0 5px; */
        padding: 4px 4px;
        background-color: rgba(0, 0, 0, 255);
        border-radius: 10px;
        margin-top: 6px;
        margin-left: 6px;
        margin-right: 6px;
        margin-bottom: 6px;
        border-width: 0px;
    }

    /* #workspaces button { */
    /*     padding: 0 5px; */
    /*     background: transparent; */
    /*     color: white; */
    /*     border-top: 2px solid transparent; */
    /* } */
    /**/
    /* #workspaces button.focused { */
    /*     color: #c9545d; */
    /*     border-top: 2px solid #c9545d; */
    /* } */

    #mode {
        background: #64727D;
        border-bottom: 3px solid white;
    }

    #clock, #battery, #cpu, #custom-logo, #memory, #network, #pulseaudio, #custom-spotify, #temperature, #tray, #mode {
        padding: 0 3px;
        margin: 0 2px;
        background-color: rgba(0, 0, 0, 255);
        border-radius: 10px;
    }

    #clock {
        font-weight: bold;
    }

    #battery {
    }

    #battery icon {
        color: red;
    }

    #battery.charging {
    }

    @keyframes blink {
        to {
            background-color: #ffffff;
            color: black;
        }
    }

    #battery.warning:not(.charging) {
        color: white;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }

    #cpu {
    }

    #memory {
    }

    #network {
    }

    #network.disconnected {
        background: #f53c3c;
    }

    #pulseaudio {
    }

    #pulseaudio.muted {
    }

    #custom-spotify {
        color: rgb(102, 220, 105);
    }

    #tray {
    }


    '';

  };
}

#   settings = [
#     {
#       layer = "top";
#       position = "top";
#       height = 36;
#       width = 1920;
#
#       modules-left = [ "custom/separator" "custom/logo" "custom/spotify" "tray"];
#       modules-center = [ "hyprland/window" ];
#       modules-right = [ "pulseaudio" "custom/separator" "battery" "custom/separator"  "network" "custom/separator"  "clock" "custom/separator"];
#
#       "hyprland/workspaces" = {
#         disable-scroll = true;
#         all-outputs = true;
#         format = "{icon}";
#         format-icons = {
#           "1" = "";
#           "2" = "";
#           "3" = "";
#           "4" = "";
#           "5" = "";
#           "6" = "";
#           urgent = "";
#           focused = "";
#           default = "";
#         };
#       };
#
#       tray = {
#         spacing = 10;
#       };
#
#       clock = {
#         format-alt = "{:%Y-%m-%d}";
#         timezone = "America/Argentina/Buenos_Aires";
#       };
#
#       cpu = {
#         format = "{usage}% ";
#       };
#
#       memory = {
#         format = "{}% ";
#       };
#
#       battery = {
#         bat = "BAT0";
#         states = {
#           warning = 30;
#           critical = 15;
#         };
#         format = "{icon}";
#         format-icons = [ "" "" "" "" "" ];
#       };
#
#       network = {
#         format-wifi = "";
#         format-ethernet = "󰈀";
#         format-disconnected = "⚠";
#         on-click = "kitty nmtui";
#       };
#
#       pulseaudio = {
#         format = "{icon}";
#         format-bluetooth = "{volume}% {icon}";
#         format-muted = "";
#         format-icons = {
#           headphones = "";
#           handsfree = "";
#           headset = "";
#           phone = "";
#           portable = "";
#           car = "";
#           default = [ "" "" ];
#         };
#         on-click = "pavucontrol";
#       };
#
#       "custom/spotify" = {
#         format = " {}";
#         max-length = 40;
#         interval = 30;
#         exec = "$HOME/.config/waybar/mediaplayer.sh 2> /dev/null";
#         exec-if = "pgrep spotify";
#       };
#
#       "custom/separator" = {
#         format = "  ";
#       };
#
#       "custom/logo" = {
#         format = "  ";
#         on-click = "pkill hyprsysteminfo || hyprsysteminfo";
#       };
#     }
#   ];

#   font-family: "Ubuntu Nerd Font";
#   font-size: 14px;
