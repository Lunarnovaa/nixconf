# nixconf

I've been using NixOS since 22 June 2024. This is the config I run on all my systems. I am very much not an expert, so I would suggest you reference others before mine.

## Structure

My nixconf is structured specifically to be logical and help me work with it. Here's a basic rundown.

- [`flake.nix`](./flake.nix) Nix Flake: Importing flakes, pinning versions, defining module directories
- [`hosts/`](./hosts) System specific configuration: Mainly `hardware-configuration.nix` and specific option selection, especially defining the profiles.
  - [`${hostName}/configuration.nix`](./hosts/polaris/configuration.nix) System-level configurations exclusive to the host
  - [`${hostName}/hardware-configuration.nix`](./hosts/polaris/hardware-configuration.nix) Auto-generated per-host
  - [`${hostName}/options.nix`](./hosts/polaris/options.nix) Option selection
- [`modules/`](./modules) Modular system configuration: HM and Nix modules stored in one place to highlight option sharing
  - [`hm`](./modules/hm) Home-Manager Modules: Program configuration
    - [`apps`](./modules/hm/apps) App Configuration: Configures specific apps
    - [`hyprland`](./modules/hm/hyprland) Hyprland configuration: configures Hyprland and any programs associated with it
    - [`theming`](./modules/hm/theming) Theming: Themes GTK and QT
  - [`nix`](./modules/nix) Nix Modules: System-level configuration
    - [`core`](./modules/nix/core) Core Nix Modules: Critical infrastructure for systems
    - [`optionals`](./modules/nix/optionals) Optional Nix Modules: Profile specific system-level modules
  - [`options`](./modules/options) Module Options: Configures what modules are disabled or enabled per system & per profile
    - [`apps`](./modules/options/apps) Declaration of app options
    - [`modules`](./modules/options/modules) Custom module declaration
    - [`profiles`](./modules/options/profiles) Options configured by profile
- [`secrets`](./secrets) Agenix Secrets Management

### How the profiles work

1. Specific profile option is declared as a module and enabled or disabled per-system.
2. An option for each program included in the profile is declared.
3. If that profile is enabled, the program options are enabled.
4. Any of the program options can be forcibly enabled or disabled per-system.
5. All of the above is imported into both Home Manager and NixOS as modules.

Credit to [@NotAShelf](https://github.com/NotAShelf/Nyx) for inspiration and references.

### Where's `home.nix`?

I replaced it with [`options.nix`](./hosts/polaris/options.nix). I previously only used it for home-manager options, so when I replaced my option system it was no longer needed. This allows me to make system-specific configuration that may be referenced in both Nix and HM modules.

## Hosts

| Name                          | Description                                                                                     | Profiles            | Type    |
| :---------------------------  | :---------------------------------------------------------------------------------------------- | :-----------------: | :-----: |
| [`polaris`](./hosts/polaris/) | Primary daily-driver: the first system I installed NixOS on.                                    | Gaming, Workstation | Desktop |
| [`procyon`](./hosts/procyon/) | Framework 13 laptop with a Ryzen 7040.                                                          | Workstation         | Laptop  |

## Credits

No project is done alone. This is especially so in the FOSS World. I would like to credit and thank the following people for sharing their configuration, wisdom, or knowledge:

[@vimjoyer](https://www.youtube.com/@vimjoyer), for his videos, and for his public nixconf, which I learned and referenced for my own configuration.

[@viperML](https://github.com/viperML), especially for his blogposts, but also for his projects like [nh](https://github.com/viperML/nh).

[@itslychee](https://github.com/itslychee), for help on Discord.

[@NotAShelf](https://github.com/NotAShelf), both on Discord and through his now archived Nix config that I have referenced for this README and for my profile options system, and probably for other reasons that I may be missing.

This list will be sure to grow, and I have probably missed pepole. So to everyone else I have interacted with on my Nix journey, thank you.

## Licensing

This repo is protected under [GPLv3](./LICENSE). If you use any of my code I would prefer if you could give me credit either with a comment or in the README, but I'm not really picky.
