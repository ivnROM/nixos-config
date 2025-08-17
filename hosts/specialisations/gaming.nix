{ config, pkgs, ... }:

{
  specialisation = {
    gaming = {
      configuration =
        {
          environment.systemPackages = with pkgs; [
            gamemode
          ];

          programs.steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;
            gamescopeSession.enable = true;
          };
        };
    };
  };
}
