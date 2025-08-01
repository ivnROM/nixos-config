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
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    HOSTNAME = "vortex";
    HYPRCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRSHOT_DIR = "${config.home.homeDirectory}/Pictures/Screenshots/";
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Bibata-Modern-Classic";
  };

  programs.zoxide.enable = true;
  programs.bash.enable = true;
  programs.neovim.enable = true;

  programs.git = {
    enable = true;
    userName = "ivan meyer";
    userEmail = "meyerivanoliver@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  programs.vesktop.enable = true;
  stylix.targets.vesktop.enable = false;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
