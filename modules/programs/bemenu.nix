{ pkgs, config, lib, ... }:

{
  stylix.targets.bemenu.alternate = true;
  programs.bemenu = {
    enable = true;

    settings = {
      ignorecase = "true";
    };
  };
}
