{ pkgs, config, lib, ... }: let 
  # waybarConfigPath = "${config.home.homeDirectory}/TempDotfiles/waybar/config.jsonc";
in
  {
  stylix.targets.waybar = {
    enable = true;
    addCss = false;
  };

  home = {
    # file = {
    #   ".config/waybar/config.jsonc".source = config.lib.file.mkOutOfStoreSymlink waybarConfigPath;
    # };
  };

  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 37;
        width = 1920;
        spacing = 0;

        modules-left = [ "custom/logo" "hyprland/workspaces" "gamemode" ];
        modules-center = [ "clock" ];
        modules-right = [ "group/rightbox" ];

        gamemode = {
          format = "{glyph}";
          format-alt = "{glyph}= {count} ";
          glyph = " ";
          hide-not-running = true;
          use-icon = false;
          icon-name = "input-gaming-symbolic";
          icon-spacing = 4;
          icon-size = 20;
          tooltip = true;
          tooltip-format = "Games running: {count}";
        };

        "group/hardware" = {
          modules = [ "custom/hardwaregrouplogo" "temperature" "cpu" "memory" ];
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            children-class = "not-hardware";
            transition-left-to-right = true;
          };
        };

        "group/rightbox" = {
          modules = [ "group/hardware" "network" "pulseaudio" ];
          orientation = "inherit";
        };

        temperature = {
          hwmon-path = "/sys/class/hwmon/hwmon0/temp1_input";
          format = "{temperatureC}°C";
          tooltip-format = "Temperatura CPU";
        };

        cpu = {
          format = " {icon}";
          format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            urgent = " ";
            active = " ";
            default = " ";
          };
        };

        "hyprland/window" = {
          format = "{title}";
          separate-outputs = true;
        };

        tray = {
          spacing = 10;
        };

        clock = {
          format-alt = "{:%d/%m/%Y}";
          timezone = "America/Argentina/Buenos_Aires";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
            tz_up = "tz_up";
            tz_down = "tz_down";
          };
        };

        memory = {
          format = "{used:0.1f}G  ";
          on-click = "kitty -e btop";
          tooltip-format = "RAM: {}%";
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
          format = "{ifname}";
          format-ethernet = "{ipaddr}/{cidr}";
          format-wifi = "{ipaddr}/{cidr}";
          format-disconnected = "󰚌";
          tooltip-format = " {gwaddr}";
          on-click = "kitty nmtui";
          interval = 1;
        };

        pulseaudio = {
          format = "{icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphones = " ";
            handsfree = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [ " " " " ];
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
          format = " ";
          on-click = "pkill hyprsysteminfo || hyprsysteminfo";
        };

        "custom/hardwaregrouplogo" = {
          format = " ";
        };
      }
    ];

    style = ''
    * {
        border: none;
        /* padding: 0.1rem; */
    }

    .modules-left, .modules-center, .modules-right {
      background-color: @base00;
      border-radius: 10px;
      min-height: 2px;
      margin: 4px;
      padding: 0 2px;
      /* border: 2px solid #fcfcce; */
      /* padding: 4 4px; */
    }

    tooltip {
      background: @base01;
      border: 2px solid @base02;
    }

    #window {
        font-weight: bold;
        /* padding: 4px 6px; */
        /* background-color: rgba(0, 0, 0, 0);*/
        background-color: @base00;
        /* border-radius: 10px; */
        /* margin-top: 6px; */
        /* margin-left: 6px; */
        /* margin-right: 6px; */
        /* border-width: 0px; */
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
      background-color: @base00;
      border-width: 0px;
      padding: 0 10px;
      margin: 0 15px;
    }

    #workspaces button {
      all: unset;
      padding: 0 5px;
      color: @base02;
      transition: all 0.3s linear;
    }

    #workspaces button:hover {
      color: @base01;
      border: none;
      transition: all 1s ease;
    }

    #workspaces button.active {
      color: @base05;
    }

    #clock, #battery, #custom-logo, #custom-hardwaregrouplogo, #network, #pulseaudio, #custom-spotify, #tray, #mode {
        padding: 0 4px;
        margin: 3 2px;
        /* background-color: @base00; */
        border-radius: 10px;
        background-color: @base01;
        border: 2px solid @base02;
        /* border: 2px solid transparent; */
        /* border-image: linear-gradient(90deg, @base02 0%, @base03 90%); */
        color: @base05;
    }

    #temperature, #cpu, #memory {
        padding: 0 4px;
        margin: 3 6px;
        border-radius: 5px;
        background-color: @base01;
        color: @base05;
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

    #network.disconnected {
        background: #f53c3c;
    }

    #pulseaudio {
    }

    #pulseaudio.muted {
    }

    #tray {
    }

    #custom-logo {
      all: unset;
      padding: 0 15px;
      margin: 0 -3px;
      /* background-color: @base00; */
      border-radius: 10px;
      background-color: @base01;
      /* border-image: linear-gradient(90deg, @base02 0%, @base03 90%); */
      color: @base05;
    }

    #group-hardware {
      padding: 0px 0px;
      border-radius: 15px;
      margin: 4px;
      color: @base01;
      transition: all .5s ease-in;
    }
    '';
  };
}
