{...}: {
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

  # Enables Colemak systemwide
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak";
  };
}
