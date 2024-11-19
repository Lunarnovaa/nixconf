{
  inputs,
  config,
  ...
}: {
  home-manager.sharedModules = with inputs; [
    self.outputs.homeManagerModules.default
    spicetify-nix.homeManagerModules.default
    nvf.homeManagerModules.default
  ];

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    users = {
      "lunarnova" = {
        imports = [
          ./../../../../hosts/${config.networking.hostName}/options.nix
        ];

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
