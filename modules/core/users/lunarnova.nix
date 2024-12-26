{config, ...}: {
  # Define the User
  users.users.lunarnova = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    hashedPasswordFile = config.age.secrets.userPassword.path;
  };

  # Setup hjem
  homes.lunarnova = {
    directory = "/home/lunarnova";
    enable = true;
    user = "lunarnova";
  };
}
