{ pkgs, config, lib, ... }:

{
  programs.eww = {
    enable = true;
    enableBashIntegration = true;
    # configDir = ./config;
  };
  home.file.".config/eww".source = config.lib.file.mkOutOfStoreSymlink "/home/ivan/eww";

}
