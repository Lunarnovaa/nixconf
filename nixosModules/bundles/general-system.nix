{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  ################################################
  ## General Boilerplate necessary for building ##
  ################################################

  # ALlowing Unfree Packages
  nixpkgs.config.allowUnfree = true;

  # Enabling Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configuring the Bootloader
  boot.loader = {
    systemd-boot = {
      enable = true;
    };
    efi = {
      canTouchEfiVariables = true;
    };
  };

  ################################################################
  ## Non-Critical Utilities that probably shouldn't be disabled ##
  ################################################################

  # Enables Colemak systemwide
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak";
  };

  # Making Chromium + Eectron apps use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enabling Networking
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # Enabling Sound with Pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  # Configuring Timezone
  time.timeZone = "America/Los_Angeles";

  # Enabling CUPS to Print
  services.printing.enable = true;

  # Enabling Autodiscovery of Printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Selecting internationalisation properties.
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

  environment.systemPackages = [pkgs.nushell];

  # Defining the User
  users.users.lunarnova = {
    isNormalUser = true;
    description = "Aura Cawley";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.nushell;
  };

  ##############################################
  ## Extra Utilities I want in all my systems ##
  ##############################################

  # Configurating Fonts including support for Hanzi
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

  # Adding support for typing Pinyin -> Hanzi
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
}
