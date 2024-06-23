{ pkgs, lib, config, ... }: {
  imports = [ 
    ./services/home-manager.nix #currently, there does not seem to be a need
    ./bundles/general-desktop.nix #to add disable option to these two modules
    ./services/nvidia.nix
    ./bundles/gaming.nix
    ./bundles/stylix/stylix.nix
    ./bundles/hyprland.nix
    ./bundles/kde.nix
  ];

  nvidia.enable =
    lib.mkDefault false;
  gaming.enable =
    lib.mkDefault false;
  hyprland.enable = 
    lib.mkDefault true;
  kde.enable =
    lib.mkIf config.hyprland.enable false;
	#lib.mkDefault true;
}
