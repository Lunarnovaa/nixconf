{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    alejandra,
    ...
  } @ inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/default/configuration.nix
          ./nixosModules
          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix
          {environment.systemPackages = [alejandra.defaultPackage.x86_64-linux];}
        ];
      };
      laptop = nixpkgs.lib.nixosSystem {
         specialArgs = { inherit inputs; };
         modules = [
           ./hosts/laptop/configuration.nix
           ./nixosModules
          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix
          {environment.systemPackages = [alejandra.defaultPackage.x86_64-linux];}

         ];
       };
    };
    homeManagerModules.default = ./homeManagerModules;
  };
}
