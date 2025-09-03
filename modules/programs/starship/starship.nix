{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$username$hostname$directory"
      ];
      scan_timeout = 10;
    };
  };
}

