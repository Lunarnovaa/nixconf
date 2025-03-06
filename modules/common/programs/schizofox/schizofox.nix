{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    #inputs.schizofox.nixosModule
  ];

  config = {
    # hjem.users.lunarnova.programs.schizofox = {

    #};
  };
}
