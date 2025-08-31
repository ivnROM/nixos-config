{ config, pkgs, inputs, lib, ... }:

{

  imports = [
    ../../modules/default.nix
    ../../modules/common/home_common.nix
  ];

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    bluez
    bluetui
    stremio
    sqls
    libsecret
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "vim";
    NIXOS_OZONE_WL = "1";
    HOSTNAME = "maelstrom";
    HYPRCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRSHOT_DIR = "${config.home.homeDirectory}/Pictures/Screenshots/";
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Bibata-Modern-Classic";
  };

  services.gnome-keyring.enable = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
