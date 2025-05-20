{ pkgs, config, lib, ... }:

{
  programs.eww = {
    enable = false;
    enableBashIntegration = true;
    configDir = ./config;
  };
}
