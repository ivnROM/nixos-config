{ pkgs, config, lib, ... }:
let
  host = config.home.sessionVariables.HOSTNAME or "default";
  fontsize = {
    maelstrom = "14";
    vortex = "22";
    default = "22";
  };
  selected_fontsize = fontsize.${host} or fontsize.default;
in
{
  stylix.targets.foot.enable = true;
  programs.foot = {
    enable = true;
    # ver el servidor
    # server.enable = true;
    settings = {
      main = {
        font = lib.mkForce "Cozette:size=${selected_fontsize}";
        dpi-aware = lib.mkForce "true";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
