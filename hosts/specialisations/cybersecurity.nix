{ config, pkgs, ... }:

{
  specialisation = {
    cybersec = {
      configuration = { config, pkgs, ... }: {
        networking = {
          hosts = {
            "10.129.54.100" = ["unika.htb"];
          };
          firewall.allowedTCPPorts = [ 5986 443 ];
        };

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
          responder
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

