{ pkgs, config, lib, ... }:

{
  stylix.targets.yazi.enable = true;

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    shellWrapperName = "y";
  };
}
