{ pkgs, config, lib, ... }:
let
  path = config.home.homeDirectory + "/Pictures/Wallpapers";
  findWallpaperScript = pkgs.writeShellScript "eww-find-wallpaper.sh" ''
      ${pkgs.eza}/bin/eza --absolute -1 -X "${path}" | jq -R . | jq -s .
  '';
in
{
  programs.eww = {
    enable = true;
    enableBashIntegration = true;
    # configDir = ./config;
  };

  home.file = {
    ".config/eww/eww.yuck".source = config.lib.file.mkOutOfStoreSymlink "/home/ivan/eww/eww.yuck";
    ".config/eww/scripts/eww-find-wallpaper.sh".source = findWallpaperScript;
  };
}
