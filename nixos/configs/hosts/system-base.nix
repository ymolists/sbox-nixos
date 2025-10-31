{
  config,
  lib,
  inputs,
  pkgs,

  ...
}:

{

  config = lib.mkIf config.system-base.enable {
    nix = {
      channel = {
        enable = false;
      };
      settings = {
        warn-dirty = false;
        experimental-features = "nix-command flakes";
        trusted-users = [
          "root"
          "ymo"
          
        ];
      };
      optimise = {
        automatic = true;
      };
      registry = 	  (lib.mapAttrs (_: flake: { inherit flake; }))
		((lib.filterAttrs (_: lib.isType "flake")) inputs);
    };
    nixpkgs = {
      overlays = [
        
      ];
      config = {
        allowUnfree = true;
      };
    };
    system = {
      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken: It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system:
      # Before changing this value read the documentation for this option
      # (e:g: man configuration:nix or on https://nixos:org/nixos/options:html):
      # Did you read the comment?
      stateVersion = "25.05";
    };

  };
}