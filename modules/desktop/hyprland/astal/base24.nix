{config, ...}: let
  cfg = config.theme.colors;
in {
  hjem.users.lunarnova.files."tmp/astal-colors.scss".text = ''
    $base00: ${cfg.base00};
    $base01: ${cfg.base01};
    $base02: ${cfg.base02};
    $base03: ${cfg.base03};
    $base04: ${cfg.base04};
    $base05: ${cfg.base05};
    $base06: ${cfg.base06};
    $base07: ${cfg.base07};
    $base08: ${cfg.base08};
    $base09: ${cfg.base09};
    $base0A: ${cfg.base0A};
    $base0B: ${cfg.base0B};
    $base0C: ${cfg.base0C};
    $base0D: ${cfg.base0D};
    $base0E: ${cfg.base0E};
    $base0F: ${cfg.base0F};
    $base10: ${cfg.base10};
    $base11: ${cfg.base11};
    $base12: ${cfg.base12};
    $base13: ${cfg.base13};
    $base14: ${cfg.base14};
    $base15: ${cfg.base15};
    $base16: ${cfg.base16};
    $base17: ${cfg.base17};
  '';
}
