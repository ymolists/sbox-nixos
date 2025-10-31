{
  config,
  lib,
  inputs,
  pkgs,

  ...
}:

{

  config = lib.mkIf config.users-tester.enable {
    users = {
      users = {
        tester = {
          openssh = {
            authorizedKeys = {
              keys = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDf4Qw1lN/pc0tKrJgiPSDzo0GY/384T05R60kQpKGul tester.fake.email@gmail.com"
                
              ];
            };
          };
          isNormalUser = true;
          initialPassword = "test123";
          extraGroups = [
            "audio"
            "wheel"
            "networkmanager"
            "docker"
            "incus-admin"
            "libvirtd"
            
          ];
        };
      };
    };

  };
}