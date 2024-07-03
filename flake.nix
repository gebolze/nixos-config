{
  description = "My personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, disko, home-manager, ... }: {
    nixosConfigurations.ryzen = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
      	disko.nixosModules.disko
      	./disko-config.nix { _module.args.disks = [ "/dev/nvme1n1" ]; }
      	./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.gebolze = import ./home.nix;
	}
      ];
    };
  };
}
