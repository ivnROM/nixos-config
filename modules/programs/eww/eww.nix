{ pkgs, config, lib, ... }:

{
  programs.eww = {
    enable = true;
    enableBashIntegration = true;
    configDir = ./config;
  };
}
