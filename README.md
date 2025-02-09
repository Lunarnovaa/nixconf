# nixconf

I've been using NixOS since 22 June 2024. This is the config I run on all my systems. It has gone through many, many iterations and has come to be a passion project of mine; I am sure it will continue to be iterated upon, improved, and expanded. I have learned much from it and I look forward to continuing to learn from it.

## Structure

My nixconf is structured specifically to be logical and help me work with it. Here's a basic rundown:

- [`flake.nix`](./flake.nix) Nix Flake: The entry-point of my system.
- [`flake`](./flake) Flake modules: The parts of my flake that make up the whole, powered by [flake-parts](https://github.com/hercules-ci/flake-parts).
  - [`lib`](./flake/lib) Extended Lib: Custom function declaration
  - [`pkgs`](./flake/pkgs) Nixpkgs Overlay: Custom mkDerivations written by yours truly
- [`hosts/`](./hosts) System specific configuration: Mainly `hardware-configuration.nix` and specific option selection, especially defining the profiles.
  - [`${hostName}/configuration.nix`](./hosts/polaris/configuration.nix) Host-specific configuration & module selection
  - [`${hostName}/hardware-configuration.nix`](./hosts/polaris/hardware-configuration.nix) Auto-generated per-host
- [`modules/`](./modules) Modular system configuration: The bulk of my system configuration
  - [`common`](./modules/common) Modules that are generally made available to all my hosts.
  - [`desktop`](./modules/desktop) Desktop modules: Primarily Hyprland currently.
  - [`options`](./modules/options) Module Options: Configures what modules are disabled or enabled per system and per profile
    - [`config`](./modules/options/config) Special host configuration options
    - [`modules`](./modules/options/modules) Custom module declaration
    - [`profiles`](./modules/options/profiles) Options and apps configured by profile
  - [`profiles`](./modules/profiles) Profile modules: Special programs, services, and configuration needed on each profile.
- [`secrets`](./secrets) Agenix Secrets Management

### How the profiles work

1. Specific profile option is declared as a module and enabled or disabled per-system.
2. An option for each program included in the profile is declared.
3. If that profile is enabled, the program options are enabled.
4. Any of the program options can be forcibly enabled or disabled per-system.
5. All of the above is imported into both Home Manager and NixOS as modules.

Credit to [@NotAShelf](https://github.com/NotAShelf/Nyx) for inspiration and references.

### Why don't you use Home Manager?

[Home Manager](https://github.com/nix-community/home-manager) is a lovely tool for many people that helps manage their dotfiles for them. I used it myself for the first 6 months of my journey on NixOS. I then decided it was best to move away from it. With [@NotAShelf](https://github.com/NotAShelf) and [@éclairevoyant](https://github.com/eclairevoyant)'s [Hjem](https://github.com/feel-co/hjem), I successfully migrated from Home Manager and began managing my dotfiles myself.

Home Manager has a few problems for me, in increasing severity:

1. Abstracts too much;
2. Lengthens eval times; and
3. Requires a differentiation between HM modules and Nix modules.

In the past, I structured my nixconf to account for the differentiation between the two module types, but it caused me  incoveniences that I would rather have gone without.

If you wish to do the same, I would consider this config to be a decent jumping-off point. You may also want to keep an eye on my currently very WIP [Hjem Rum](https://github.com/the-unnamed-nug/hjem-rum), a module collection for hjem, offering options similar to Home Manager. This solves the latter two issues while not neglecting the fact that for many, the first issue is not a bug but a feature.

### I have a million other questions :c

For a while, I tried to document and explain any quirky choices I made in my config. But at this point, I'm past my limit, and I'm adding more insanity to it by the week. If you have any questions for how or why I did something a certain way, you can feel free to reach out to me.

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

[@NotAShelf](https://github.com/NotAShelf), for enough reasons that I am certain to leave something out. For his now archived Nix config, for the extensive help and patience he has given me, and for being insane enough to do a lot that I have learned from. Much of my config is heavily inspired by his.

This list will be sure to grow, and I have probably missed people. So to everyone else I have interacted with on my Nix journey, thank you.

## Licensing

Unless explicitly stated otherwise, all code within this repo is protected under [GPLv3](./LICENSE). If you use any of my code please give me credit with a comment and optionally in the README.
