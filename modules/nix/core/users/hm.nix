{
  inputs,
  config,
  ...
}: {
  home-manager.sharedModules = [
    inputs.self.outputs.homeManagerModules.default
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    users = {
      "lunarnova" = {
        imports = [./../../../../hosts/${config.networking.hostName}/home.nix];

        programs.home-manager.enable = true;

        # Giving Home Manager User/Home info
        home.username = "lunarnova";
        home.homeDirectory = "/home/lunarnova";
      };
    };

    backupFileExtension = "backup2";
  };
}
