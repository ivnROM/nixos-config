{ config, pkgs, lib, ... }:
let
  host = config.home.sessionVariables.HOSTNAME or "default";
  wallpaper = {
    "maelstrom" = builtins.fetchurl {
      url = "https://w.wallhaven.cc/full/og/wallhaven-og33jl.png"; 
      sha256 = "0scxw4skf2vd377xcmcfj55jgrj4a2qly2wqxxxfhdwmv7b4r3q0";
    };
    "vortex" = builtins.fetchurl {
      url = "https://w.wallhaven.cc/full/6l/wallhaven-6lkl5q.png";
      sha256 = "1kzm3a51xc1psv7hk8zwpkrlyi4jqdvah1lra3sxmiifyd2gz8mb";
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

