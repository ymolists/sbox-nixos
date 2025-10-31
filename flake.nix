{
  description = ''
    Please also check out the starter configs mentioned above.
  '';

  inputs = {

    ## remove later 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-dell.url = "github:NixOS/nixos-hardware/master";
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self,

    nixpkgs,
    nixpkgs-unstable,

    ...
  } @inputs:

  let
    #inherit (self) outputs;

    system = "x86_64-linux";
    systems = [ "x86_64-linux"];

    forAllSystems = nixpkgs.lib.genAttrs systems;
    
    # here we are instantiating the pkgs-unstable object
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

  in {
    #formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

    nixosConfigurations = {

      docean-minimal = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        
        # here we are passing the  pkgs-unstable instance from above down to this module
        specialArgs = {
          inherit inputs pkgs-unstable;
        };

        modules = [
          ./nixos/configs/hosts/docean
        ];
      };
    };

  };
}