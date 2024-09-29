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
  - [`hm`](./modules/hm) Home-Manager Modules: Configures specific programs 
  - [`nix`](./modules/nix) Nix Modules: System-level configuration
    - [`core`](./modules/nix/core) Core Nix Modules: Critical infrastructure for systems
    - [`optionals`](./modules/nix/optionals) Optional Nix Modules: Profile specific system-level modules
  - [`options`](./modules/options) Module Options: Configures what modules are disabled or enabled per system & per profile
    - [`bundles`](./modules/options/bundles) Bundled options unrelated to profiles
    - [`loose`](./modules/options/loose) Ungrouped options
    - [`profiles`](./modules/options/profiles) Options configured by profile

### How the profiles work

1. Specific profile option is declared as a module and enabled or disabled per-system.
2. An option for each program included in the profile is declared.
3. If that profile is enabled, the program options are enabled.
4. Any of the program options can be forcibly enabled or disabled per-system.
5. All of the above is imported into both Home Manager and NixOS as modules.

Credit to [raf](https://github.com/NotAShelf) for inspiration and references.

### Where's `home.nix`?

I replaced it with [`options.nix`](./hosts/polaris/options.nix). I previously only used it for home-manager options, so when I replaced my option system it was no longer needed.

## Hosts

| Name                          | Description                                                                                     | Profiles            | Type    |
| :---------------------------  | :---------------------------------------------------------------------------------------------- | :-----------------: | :-----: |
| [`polaris`](./hosts/polaris/) | Primary daily-driver: the first system I installed NixOS on.                                    | Gaming, Workstation | Desktop |
| [`procyon`](./hosts/procyon/)       | Framework 13 laptop with a Ryzen 7040.                                                          | Workstation         | Laptop  |


## How can I use it?

Please don't. It definitely won't work for you without funky tinkering and issues. So if you do, please don't come to me with your problems. You could probably use code from this repo for use in your own configuration, just be sure not to use stuff if you don't know what it does. I definitely didn't design this to be plug-and-play with anybody else's host.

## Credits

No project is done alone. This is especially so in the FOSS World. I would like to credit and thank the following people for sharing their configuration, wisdom, or thoughts with me:

[Vimjoyer](https://www.youtube.com/@vimjoyer), for his videos, and for his public nixconf, which I learned and referenced for my own configuration.

[Viper](https://github.com/viperML), especially for his blogposts, but also for his projects like [nh](https://github.com/viperML/nh).

[lychee](https://github.com/itslychee), for help on Discord.

[raf](https://github.com/NotAShelf), both on Discord and through his now archived Nix config that I have referenced for this README and for my profile options system, and probably for other reasons that I may be missing.

This list will be sure to grow.

## Licensing

This repo is protected under [GPLv3](./LICENSE). If you use any of my code I would prefer if you could give me credit either with a comment or in the README, but I'm not really picky.