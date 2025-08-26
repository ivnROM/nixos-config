{ pkgs, config, lib, ... }:

{
  stylix.targets.foot.enable = true;
  programs.foot = {
    enable = true;
    # ver el servidor
    # server.enable = true;
    settings = {
      main = {
        font = lib.mkForce "Terminus:size=22";
        dpi-aware = lib.mkForce "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
