{ config, pkgs, ... }:

{
  specialisation = {
    gaming = {
      configuration =
        {
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
