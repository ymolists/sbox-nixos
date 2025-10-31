{
  config,
  lib,
  inputs,
  pkgs,

  ...
}:

{

  config = lib.mkIf config.services-openssh-service.enable {
    services = {
      openssh = {
        enable = true;
        settings = {
          KbdInteractiveAuthentication = false;
          PasswordAuthentication = true;
        };
      };
    };

  };
}