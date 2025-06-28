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

          # OSINT 
          sherlock
          tor
        ];
      };
    };
  };
}

