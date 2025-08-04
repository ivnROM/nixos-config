{ config, pkgs, lib, ...}:

{
  stylix.targets.mako.enable = true;

  services.mako = {
    enable = true;
    settings = {
      anchor="top-right";
      sort="-time";
      layer="overlay";
      #background-color=#2e3440;
      width=300;
      height=110;
      border-size=2;
      #border-color=#88c0d0;
      border-radius=2;
      icons=0;
      max-icon-size=64;
      default-timeout=5000;
      ignore-timeout=1;
      #font=monospace 14;
    };
  };
}
