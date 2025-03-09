{inputs, ...}: {
  imports = [
    inputs.schizofox.nixosModule
  ];

  config = {
    hjem.users.lunarnova.programs.schizofox = {
      enable = true;
      misc = {
        displayBookmarksInToolbar = "always";
        firefoxSync = true;
      };
      search.defaultSearchEngine = "DuckDuckGo";
    };
  };
}
