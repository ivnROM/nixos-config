{ config, pkgs, lib, ... }: 
{
  specialisation = {
    cybersec = {
      configuration =
        {
          networking = {
            hosts = {
              # "10.129.54.100" = [ "unika.htb" ];
            };
            firewall.allowedTCPPorts = [
              1337
            ];
          };

          users.users.ivan.extraGroups = [ "wireshark" "docker "];
          users.groups.wireshark.gid = 500;
          security.wrappers.dumpcap = {
            source = "${pkgs.wireshark}/bin/dumpcap";
            owner = "root";
            group = "wireshark";
            permissions = "u+xs,g+x";
          };

          virtualisation.docker = {
            enable = true;
          } // lib.mkIf (config.home.sessionVariables.HOSTNAME == "vortex") {
            daemon.settings = {
              data-root = "/mnt/hdd/DockerData";
            };
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
        remmina

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
