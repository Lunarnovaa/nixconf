{
  inputs,
  config,
  ...
}: {
  home-manager.sharedModules = [
    inputs.self.outputs.homeManagerModules.default
    inputs.spicetify-nix.homeManagerModules.default
    inputs.xremap-flake.homeManagerModules.default
  ];

  home-manager.useGlobalPkgs = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "lunarnova" = import ./../../hosts/${config.networking.hostName}/home.nix;
    };

    backupFileExtension = "backup2";
  };
}
