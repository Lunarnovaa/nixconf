{
  config,
  inputs,
  ...
}: {
  security.pam.services = {
    hyprlock = {
      name = "swaylock";
      text = ''
        auth  include login
      '';
    };
  };
}
