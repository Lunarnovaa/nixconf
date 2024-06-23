{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/default/configuration.nix
          ./nixosModules
          inputs.home-manager.nixosModules.default
          ];
      };
      #laptop = nixpkgs.lib.nixosSystem {
      #   specialArgs = { inherit inputs; };
      #   modules = [
      #     ./hosts/laptop/configuration.nix
      #     ./nixosModules
      #   ];
      # };
    };

    homeManagerModules.default = ./homeManagerModules;

  };
}
