  { config, pkgs, lib, ... }:
let
  host = config.home.sessionVariables.HOSTNAME or "default";
  wallpaper = {
    "maelstrom" = builtins.fetchurl {
      url = "https://w.wallhaven.cc/full/ly/wallhaven-ly33ml.png"; 
      sha256 = "1lky7ycrdpfk6lz5yavb00izpspmqksa9hk99x7dppydznyvk5fi";
    };
    "vortex" = builtins.fetchurl {
      url = "https://www.desktophut.com/files/1687971045-1687971045-makoto-yuki-persona-3-live-wallpaper.mp4";
      sha256 = "1q2ggsr4iq2vvll1zlzfcavdj865kbpqj3h5dxplzrh8gj038gg5";
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
    home.file = if host == "vortex" then { 
      "Pictures/Wallpapers/wallpaper.mp4".source = selected_wallpaper;
    } else {
      "Pictures/Wallpapers/wallpaper.png".source = selected_wallpaper;
    };
  services.swww = {
    enable = true;
  };
}

