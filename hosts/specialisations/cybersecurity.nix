{ config, pkgs, ... }:

{
  specialisation = {
    cybersec = {
      configuration =
        { config, pkgs, ... }:
        {
          users.users.ivan.extraGroups = [ "wireshark" ];
          networking = {
            hosts = {
              # "10.129.54.100" = [ "unika.htb" ];
            };
            firewall.allowedTCPPorts = [
              1337
            ];
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
            wpscan
            gobuster
            wfuzz
            sqlmap
            zap

            # Exploiting / post-exploit
            responder
            metasploit

            # Redes y utilidades
            arp-scan
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
