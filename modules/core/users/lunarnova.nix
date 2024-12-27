{config, ...}: {
  # Define the User
  users.users.lunarnova = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    hashedPasswordFile = config.age.secrets.userPassword.path;
  };

  # Setup hjem
  hjem = {
    clobberByDefault = true;
    users.lunarnova = {
      enable = true;
      directory = "/home/lunarnova";
      user = "lunarnova";
    };
  };
}
