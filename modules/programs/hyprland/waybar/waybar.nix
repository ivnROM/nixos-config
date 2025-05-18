{ pkgs, config, lib, ...}:

{
  programs.waybar = {
    enable = true;
    style = lib.mkForce ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        spacing = 0;
        height = 0;

        margin-top = 8;
        margin-right = 8;
        margin-bottom = 0;
        margin-left = 8;

        modules-left = [
          "sway/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "cpu_text"
          "cpu"
          "memory"
          "battery"
          "network"
          "pulseaudio"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          tooltip = false;
        };

        tray = {
          spacing = 10;
          tooltip = false;
        };

        clock = {
          format = "{:%H:%M - %a, %d %b %Y}";
          tooltip = false;
          timezone = "America/Argentina/Buenos_Aires";
        };

        cpu = {
          format = "cpu {usage}%";
          interval = 2;
          states = {
            critical = 90;
          };
        };

        memory = {
          format = "mem {percentage}%";
          interval = 2;
          states = {
            critical = 80;
          };
        };

        battery = {
          format = "bat {capacity}%";
          interval = 5;
          tooltip = false;
          states = {
            warning = 20;
            critical = 10;
          };
        };

        network = {
          format-wifi = "wifi {bandwidthDownBits}";
          format-ethernet = "enth {bandwidthDownBits}";
          format-disconnected = "no network";
          interval = 5;
          tooltip = false;
        };

        pulseaudio = {
          scroll-step = 5;
          max-volume = 150;
          format = "vol {volume}%";
          format-bluetooth = "vol {volume}%";
          nospacing = 1;
          on-click = "pavucontrol";
          tooltip = false;
        };
      };
    };
  };
}

