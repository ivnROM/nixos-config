{ pkgs, config, lib, ... }:

{
  stylix.targets.alacritty.enable = true;
  programs.alacritty = {
    enable = false;
    settings = {
      font = lib.mkForce {
        size = 16;
        normal = {
          family = "Terminus";
          style = "Regular";
        };
      };
    };
  };
}
