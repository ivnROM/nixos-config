{ pkgs, config, lib, ... }:

{
  stylix.targets.foot.enable = true;
  programs.foot = {
    enable = true;
    # ver el servidor
    # server.enable = true;
    settings = {
      main = {
        font = lib.mkForce "Cozette:size=22";
        dpi-aware = lib.mkForce "true";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
