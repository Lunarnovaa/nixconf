{inputs, ...}: {
  home-manager.sharedModules = [
    # Home Manager Flakes Get Imported Here
    inputs.self.outputs.homeManagerModules.default
    inputs.xremap-flake.homeManagerModules.default
  ];

  home-manager.useGlobalPkgs = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "lunarnova" = import ./../../hosts/default/home.nix;
    };

    backupFileExtension = "backup2";
  };
}
