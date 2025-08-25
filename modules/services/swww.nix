{ config, pkgs, lib, ... }:
let
  host = config.home.sessionVariables.HOSTNAME or "default";
  wallpaper = {
    "maelstrom" = builtins.fetchurl {
      url = "https://w.wallhaven.cc/full/ly/wallhaven-ly33ml.png"; 
      sha256 = "1lky7ycrdpfk6lz5yavb00izpspmqksa9hk99x7dppydznyvk5fi";
    };
    "vortex" = builtins.fetchurl {
      url = "https://w.wallhaven.cc/full/yq/wallhaven-yq88md.png";
      sha256 = "0nad8a5h04bam7sdhk74aap3vjhr7581yq5q07f1yrr2060h4v9s";
    };
    "default" = builtins.fetchurl {
      url = "https://w.wallhaven.cc/full/2y/wallhaven-2y2wg6.png"; 
      sha256 = "084qgbicqiqwprb9m6l5jwij26rv8r73h76vba523z6q9rz0snlw";
    };
    # "vortex" = builtins.fetchurl;
  };
  selected_wallpaper = wallpaper.${host} or wallpaper."default";
in
  {
  home.file."Pictures/Wallpapers/wallpaper.png".source = selected_wallpaper;
  services.swww = {
    enable = true;
  };
}

