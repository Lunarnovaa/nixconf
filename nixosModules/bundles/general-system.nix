{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # Enables Unfree Packages
  nixpkgs.config.allowUnfree = true;

  # Enables Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Makes Chromium + Eectron apps use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enables Colemak systemwide
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak";
  };

  # Font configurations here as Stylix does not currently support fallback fonts
  fonts = {
    enableDefaultPackages = false;
    packages = builtins.attrValues {
      inherit
        (pkgs)
        inter
        ubuntu_font_family #ubuntu-monospace
        
        roboto-serif
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        ;
    };
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK SC" "Roboto Serif"];
        sansSerif = ["Noto Sans CJK SC" "Inter"];
        monospace = ["Noto Sans Mono CJK SC" "Ubuntu Monospace"];
      };
    };
  };
  # For Pinyin
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      rime-data
      fcitx5-rime
      fcitx5-gtk
      fcitx5-configtool #if having issues with qt compatibility, run fcitx5-config-qt
      fcitx5-chinese-addons
      fcitx5-mozc
    ];
  };

  # Enabling xremap for home-manager
  hardware.uinput.enable = true;
  users.groups.uinput.members = ["lunarnova"];
  users.groups.input.members = ["lunarnova"];

  # Enabling a udev rule for VIA customization
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  networking.networkmanager.enable = true; #enable network
  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  time.timeZone = "America/Los_Angeles";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enables autodiscovery of printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  #Bootloader Configuration
  boot.loader = {
    systemd-boot = {
      enable = true;
    };
  };
}
