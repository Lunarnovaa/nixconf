{
  config,
  pkgs,
  lib,
  ...
}: {
  # Giving Home Manager User/Home info
  home.username = "lunarnova";
  home.homeDirectory = "/home/lunarnova";

  # Letting Home Manager install and manage itself.
  programs.home-manager.enable = true;

  #################################
  ## Home Manager Module Options ##
  #################################

  firefox-vertical-tabs.enable =
    lib.mkForce true;
  obs.enable =
    lib.mkForce true;
  #xremap.enable =
  #  lib.mkForce false; # false as on x11 we require it to be systemwide, enabled through x11.enable

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lunarnova/etc/profile.d/hm-session-vars.sh
  #

  ##################################################################
  ## Danger Zone                                                  ##
  ##################################################################
  ## This number should not be changed in any case.               ##
  ## It is the version number used in the first install.          ##
  ## The version should be "24.05". Do not change it from         ##
  ## "24.05". Just don't.                                         ##
  home.stateVersion = "24.05"; # Did you read the comment?    ##
  ##################################################################
}
