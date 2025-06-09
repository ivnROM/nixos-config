{ pkgs, config, lib, ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
  };
}
