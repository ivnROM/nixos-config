{ pkgs, config, lib, ... }:

{
  programs.eww = {
    enable = false;
    enableBashIntegration = true;
    # configDir = ./config;
  };
  # home.file.".config/eww".source = config.lib.file.mkOutOfStoreSymlink "/home/ivan/Projects/EWWBar";
}
