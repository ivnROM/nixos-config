{ pkgs, config, lib, ... }:

{
  programs.wofi = {
    enable = true;

    settings = {
    };
    #    style = lib.mkForce ./style.css;
  };

}
