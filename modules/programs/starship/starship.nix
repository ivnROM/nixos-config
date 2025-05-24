{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./config.toml;
  };
}

