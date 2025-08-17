{ config, pkgs, ... }:

{
  specialisation = {
    gaming = {
      configuration =
        {
          environment.systemPackages = with pkgs; [
            gamemode
            gamescope
          ];

          programs.steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;
          };
        };
    };
  };
}
