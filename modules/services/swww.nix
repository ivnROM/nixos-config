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
    home.file.".config/waypaper/config.ini".text = ''
        [Settings]
        language = en
        backend = swww
        monitors = All
        fill = Fill
        sort = name
        subfolders = False
        all_subfolders = False
        show_hidden = False
        show_gifs_only = False
        show_path_in_tooltip = True
        number_of_columns = 3
        zen_mode = False
        swww_transition_type = any
        swww_transition_step = 90
        swww_transition_angle = 0
        swww_transition_duration = 2
        swww_transition_fps = 60
    '';

    home.packages = with pkgs; [
      waypaper
    ];

    services.swww = {
      enable = true;
    };

    wayland.windowManager.hyprland.extraConfig = ''
      exec-once=waypaper --restore
    '';
}

