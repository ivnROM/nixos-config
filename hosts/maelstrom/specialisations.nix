{ config, pkgs, ... }:

{
  specialisation = {
    cybersec = {
      configuration = { config, pkgs, ... }: {
        environment.systemPackages = with pkgs; [
          # Scanners
          nmap
          masscan

          # Fuerza bruta / cracking
          hydra
          john

          # Web
          gobuster
          wfuzz
          sqlmap
          zap

          # Exploiting / post-exploit
          metasploit

          # Redes y utilidades
          inetutils
          tcpdump
          wireshark
          netcat
          socat
          hping
        ];
      };
    };
    fulbito = {
      configuration = { config, pkgs, ... }: {
        environment.systemPackages = with pkgs; [
          chromium
          discord
        ];
      };
    };
    budgie = {
      configuration = { config, pkgs, ... }: {
        services.xserver.desktopManager.budgie.enable = true;
        services.xserver.enable = true;
        environment.systemPackages = with pkgs; [
        ];
      };
    };
  };
}

