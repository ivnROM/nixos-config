{ pkgs, config, lib, ... }:

{
  stylix.targets.alacritty.enable = true;
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "Terminus";
          style = "Regular";
        };
      };
    };
  };
}
