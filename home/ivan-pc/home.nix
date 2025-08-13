{ config, pkgs, inputs, lib, ... }:
{

  imports = [
    ../../modules/default.nix
    ../../modules/common/home_common.nix
  ];

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";

  home.stateVersion = "24.11"; 

  home.packages = with pkgs; [
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "vim";
    NIXOS_OZONE_WL = "1";
    HOSTNAME = "vortex";
    HYPRCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRSHOT_DIR = "${config.home.homeDirectory}/Pictures/Screenshots/";
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Bibata-Modern-Classic";
  };

  programs.vesktop.enable = true;
  stylix.targets.vesktop.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
