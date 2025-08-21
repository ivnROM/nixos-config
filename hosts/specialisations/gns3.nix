{ config, pkgs, lib, ... }: 
{
  specialisation = {
    gns3 = {
      configuration =
        {
          users.users.ivan = {
            extraGroups = [ "libvirtd" "kvm"];
          };
          environment.systemPackages = with pkgs; [
            dnsmasq
            gns3-server
            gns3-gui
            ubridge
            qemu
          ];
          security.wrappers.ubridge = {
            source = "${pkgs.ubridge}/bin/ubridge";
            capabilities = "cap_net_admin,cap_net_raw=ep";
            owner = "root";
            group = "ubridge";
            permissions = "u+rx,g+rx,o+rx";
          };

          users.groups.ubridge = {};
          users.groups.gns3 = {};

          virtualisation.libvirtd = {
            enable = true;
            qemu = {
              package = pkgs.qemu_kvm;
              runAsRoot = true;
              swtpm.enable = true;
              ovmf = {
                enable = true;
                packages = [(pkgs.OVMF.override {
                  secureBoot = true;
                  tpmSupport = true;
                }).fd];
              };
            };
          };


          # Open ports in the firewall.
          # networking.firewall.allowedTCPPorts = [ ... ];
          # networking.firewall.allowedUDPPorts = [ ... ];
          # Or disable the firewall altogether.
          # networking.firewall.enable = false;
          networking.bridges = {
              "virbr0" = {
                interfaces = [];  # Bridge sin interfaces físicas
              };
          };

          networking.interfaces = {
            virbr0 = {
              ipv4.addresses = [{
                address = "10.25.0.1";
                prefixLength = 24;
              }];
            };
          };

          networking.nat = {
            enable = true;
            internalInterfaces = ["virbr0"];
            externalInterface = "enp34s0";  # tu interfaz WiFi
          };

          networking.firewall = {
            enable = lib.mkForce false;
            allowPing = true;
            allowedTCPPorts = [ 3080 ];
            trustedInterfaces = [ "virbr0"];
          };
        };
    };
  };
}
