{ config, pkgs, ... }:

{
  specialisation = {
    cybersec = {
      configuration = { config, pkgs, ... }: {
        environment.systemPackages = with pkgs; [
          burpsuite
          exploitdb

          # Scanners
          nmap
          masscan

          # Fuerza bruta / cracking
          wordlists
          hydra
          john

          # Web
          whatweb
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
          theharvester
          sherlock
          tor
          socialscan

          # analisis de metadata
          exiftool
        ];
      };
    };
  };
}

