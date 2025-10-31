{
  lib,
  inputs,
  ...
}: {

  imports = [
    ../../../features/features-all.nix

  ../../../configs/hosts/docean/docean-disko.nix
  ../../../configs/hosts/docean/docean-hware.nix
  ../../../configs/hosts/system-base.nix
  ../../../configs/services/services-network.nix
  ../../../configs/services/services-openssh-service.nix
  ../../../configs/users/users-tester.nix
  ];

  config = {

    system-base.enable = true;
    docean-disko.enable = true;
    docean-hware.enable = true;
    users-tester.enable = true;
    services-network.enable = true;
    services-openssh-service.enable = true;


    time = {
      timeZone = "America/Toronto";
    };
    networking = {
      hostName = "docean";
    };

  };
}