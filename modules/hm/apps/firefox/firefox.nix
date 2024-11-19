{...}: {
  programs.firefox = {
    enable = true;
    profiles.lunarnova = {
      isDefault = true;

      search = {
        # Enable search configuration
        force = true;
        #Default Search Engine
        default = "DuckDuckGo";
      };
    };
  };
}
