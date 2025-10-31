{
  config,
  lib,
  inputs,
  pkgs,
  modulesPath,

  ...
}:

{

  imports = [

    (modulesPath + "/profiles/qemu-guest.nix")
    "${modulesPath}/virtualisation/digital-ocean-config.nix"
  ];

  config = lib.mkIf config.docean-hware.enable {
  };
}