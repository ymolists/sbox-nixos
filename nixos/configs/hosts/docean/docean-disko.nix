{
  config,
  lib,
  inputs,
  pkgs,

  ...
}:

{

  imports = [

    inputs.disko.nixosModules.disko
  ];

  config = lib.mkIf config.docean-disko.enable {
    disko = {
      devices = {
        disk = {
          main = {
            type = "disk";
            device = "/dev/vda";
            content = {
              type = "gpt";
              partitions = {
                boot = {
                  size = "1M";
                  type = "EF02";
                  priority = 1;
                };
                esp = {
                  size = "512M";
                  type = "EF00";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    mountOptions = [
                      "defaults"
                      "umask=0077"
                      
                    ];
                  };
                };
                root = {
                  size = "100%";
                  content = {
                    type = "filesystem";
                    format = "ext4";
                    mountpoint = "/";
                    mountOptions = [
                      "noatime"
                      "nodiratime"
                      "discard"
                      
                    ];
                  };
                };
              };
            };
          };
        };
      };
    };

  };
}