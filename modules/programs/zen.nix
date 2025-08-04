{ pkgs, config, lib, ... }:

{
  stylix.targets.zen-browser = {
    enable = true;
    profileNames = [ "Default Profile" ];
  };
}
