{ config, pkgs, ... }:

{
  specialisation = {
    cybersec = {
      configuration = { config, pkgs, ... }: {
        environment.systemPackages = with pkgs; [
          burpsuite
          exploitdb
          tor-browser-bundle-bin

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
          socialscan

          # analisis de metadata
          exiftool
          #vpn
          openvpn
        ];
      };
    };
  };
}

