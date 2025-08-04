{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    # settings = pkgs.lib.importTOML ./config.toml;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        # "$all"
        # "$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory"
        "$username$hostname$directory"
      ];
      scan_timeout = 10;
      # character = {
      #   success_symbol = "➜";
      #   error_symbol = "➜";
      # };
    };
  };
}

