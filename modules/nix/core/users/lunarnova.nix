{config, ...}: {
  # Define the User
  users.users.lunarnova = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    passwordFile = config.age.secrets.userPassword.path;
  };
}
