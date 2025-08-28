{ config, pkgs, lib, ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 800;
          on-timeout = "notify-send '󱑍 ' 'Aviso de inactividad'";
        }
        {
          timeout = 850;
          on-timeout = "brightnessctl set 50%-";
          on-resume = "brightnessctl set +50%";
        }
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
