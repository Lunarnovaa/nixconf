{...}: {
  # Set and configure specific profiles
  profiles = {
    gaming = {
      enable = true;
      apps.obs = false;
    };
    workstation = {
      enable = true;
    };
  };
}
