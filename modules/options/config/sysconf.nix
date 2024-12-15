{lib, ...}: let
  inherit
    (lib.options)
    mkOption
    ;
  inherit
    (lib.types)
    bool
    ;
in {
  options.sysconf = {
    nvidia = mkOption {
      type = bool;
      default = false;
      description = ''
        Enables the nvidia modules. This enables special driver
        configuration and configures the DE for nvidia optimizations
        and bugfixes.
      '';
    };
    powersave = mkOption {
      type = bool;
      default = false;
      description = ''
        Signals that the system wants to maximize power usage. This
        currently configures Hyprland to minimize performance expensive
        eye candy.
      '';
    };
    verticalTabs = mkOption {
      type = bool;
      default = false;
      description = ''
        Enables vertical tabs in Firefox, along with custom CSS. Keep
        in mind you still need to install the Sidebery extension for
        this to work properly, as extensions are not managed
        declaratively.
      '';
    };
  };
}
