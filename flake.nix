{
  description = "My personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, disko, ... }: {
    nixosConfigurations.ryzen = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
      	disko.nixosModules.disko
      	./disko-config.nix { _module.args.disks = [ "/dev/nvme1n1" ]; }
      	./configuration.nix
      ];
    };
  };
}
