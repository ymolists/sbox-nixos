{
  config,
  lib,
  inputs,
  pkgs,

  ...
}:

{

  config = lib.mkIf config.services-network.enable {
    boot = {
      kernel = {
        sysctl = {
          "net.ipv4.ip_forward" = 1;
        };
      };
    };
    systemd = {
      services = {
        NetworkManager-wait-online = {
          enable = lib.mkForce false;
        };
      };
    };
    networking = {
      enableIPv6 = false;
      nftables = {
        enable = true;
      };
      firewall = {
        enable = true;
        allowedTCPPorts = [
          
        ];
        allowedUDPPorts = [
          config.services.tailscale.port
          
        ];
        trustedInterfaces = [
          "incusbr*"
          "dagger*"
          "docker*"
          "tailscale*"
          
        ];
      };
      extraHosts = ''
	// for local dagger registry2
  192.168.2.10 local.registry.io
  192.168.2.10 local.ollama.server
'';
      networkmanager = {
        enable = true;
      };
    };

  };
}