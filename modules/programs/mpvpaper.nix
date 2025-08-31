  { config, pkgs, lib, ... }:
let
  host = config.home.sessionVariables.HOSTNAME or "default";
  wallpaper = {
    "maelstrom" = pkgs.fetchurl {
      url = "https://www.desktophut.com/files/CgO6yQJX9vyfkev_Pokemon%20-%20Gengar%20Bathing_2_prob4.mp4"; 
      sha256 = "qufPM1PBauDOFSoVu+bi8pvJ89Aqcvmu+VBOQzu4n+c=";
    };
    "vortex" = builtins.fetchurl {
      url = "https://www.desktophut.com/files/1687971045-1687971045-makoto-yuki-persona-3-live-wallpaper.mp4";
      sha256 = "1q2ggsr4iq2vvll1zlzfcavdj865kbpqj3h5dxplzrh8gj038gg5";
    };
    "default" = builtins.fetchurl {
      url = "https://w.wallhaven.cc/full/2y/wallhaven-2y2wg6.png"; 
      sha256 = "084qgbicqiqwprb9m6l5jwij26rv8r73h76vba523z6q9rz0snlw";
    };
  };
  selected_wallpaper = wallpaper.${host} or wallpaper."default";
in
  {
    home.file."Pictures/Wallpapers/wallpaper.mp4".source = selected_wallpaper;

    programs.mpvpaper = {
      enable = true;
      pauseList = ''
        zen
        steam
      '';
    };
}

