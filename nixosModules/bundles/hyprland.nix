{ pkgs, lib, config, inputs, ... }: {

  options = {
    hyprland.enable =
      lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;

    programs.hyprland.enable = true;
    programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    xdg.portal.enable = true;
    
    environment.systemPackages = with pkgs; [
      # waybar
     # mako
      libnotify
      swww
#      kitty
     # tofi
      hyprshot
    ];
  };

}
