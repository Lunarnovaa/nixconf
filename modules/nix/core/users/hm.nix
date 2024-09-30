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
        imports = [
          ./../../../../hosts/${config.networking.hostName}/options.nix
        ];

        programs.home-manager.enable = true;

        # Give Home Manager User/Home info
        home.username = "lunarnova";
        home.homeDirectory = "/home/lunarnova";

        ####################do not change#######################
        home.stateVersion = "24.05"; # Did you read the comment?
        #####################from 24.05#########################
      };
    };

    backupFileExtension = "backup2";
  };
}
