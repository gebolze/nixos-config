{
  description = "My personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko, home-manager, ... }@inputs:
  let
    inherit (self) outputs;
  in
  {
    nixosConfigurations.ryzen = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        ./nixos/disko-config.nix { _module.args.disks = [ "/dev/nvme1n1" ]; }
        ./nixos/configuration.nix

        # make home-manager as a module of nixos
        # so that home-manager configuration will be deployed automatically when executing
        # `nixos-rebuild switch`
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.gebolze = import ./home-manager/home.nix;
        }
      ];
    };
  };
}
