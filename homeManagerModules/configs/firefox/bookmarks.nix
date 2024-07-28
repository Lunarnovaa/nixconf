{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: {
  programs.firefox.profiles.lunarnova.bookmarks = [
    # Ground News
    {
      name = "Ground News";
      tags = ["news"];
      keyword = "ground";
      url = "https://web.ground.news/";
    }

    # Personal Repo
    {
      name = "Personal Repo";
      tags = ["github" "obsidian" "todo"];
      keyword = "personal";
      url = "https://github.com/Lunarnovaa/personal-repo/issues?q=is%3Aissue+is%3Aopen+no%3Amilestone+no%3Aproject";
    }

    # School
    {
      name = "School";
      toolbar = true;
      bookmarks = [
        {
          name = "SRJC";
          bookmarks = [
            {
              name = "Schedule of Classes";
              url = "https://portal.santarosa.edu/SRWeb/SR_ScheduleOfClasses.aspx";
              tags = ["classes" "schedule" "srjc" "school"];
              keyword = "schedule";
            }
            {
              name = "Student Portal";
              url = "https://portal.santarosa.edu/SRWeb/PortalStudentsNew.aspx";
              tags = ["portal" "srjc" "school" "classes"];
              keyword = "portal";
            }
          ];
        }
        {
          name = "Scholarships";
          bookmarks = [
            {
              name = "SRJC Scholarships";
              url = "https://scholarships.santarosa.edu/";
              tags = ["srjc" "scholarships" "college" "money"];
              keyword = "scholarships";
            }
            {
              name = "CGHS College & Career Center - Scholarships";
              url = "https://sites.google.com/petk12.org/cghs-ccc/scholarships?authuser=0";
              tags = ["cghs" "scholarships" "college" "money"];
              keyword = "scholarships";
            }
          ];
        }
        {
          name = "Canvas";
          tags = ["college" "school" "srjc" "work" "class"];
          keyword = "canvas";
          url = "https://canvas.santarosa.edu/";
        }
      ];
    }

    # The Odin Project
    {
      name = "The Odin Project";
      toolbar = true;
      bookmarks = [
        {
          name = "Dashboard | The Odin Project";
          url = "https://www.theodinproject.com/dashboard";
        }
        {
          name = "Odin Git Cheatsheet";
          url = "https://www.theodinproject.com/lessons/foundations-git-basics#cheatsheet";
        }
      ];
    }

    # NixOS
    {
      name = "NixOS";
      toolbar = true;
      bookmarks = [
        {
          name = "NixOS Wiki";
          tags = ["wiki" "nixos" "nix"];
          keyword = "nixos wiki";
          url = "https://wiki.nixos.org/wiki/NixOS_Wiki";
        }
        {
          name = "NixOS Package Search";
          tags = ["nixos" "nix" "packages" "pkgs" "search"];
          keyword = "nixos packages";
          url = "https://search.nixos.org/packages";
        }
        {
          name = "Home Manager Options Search";
          tags = ["nixos" "nix" "home manager" "search"];
          keyword = "options search";
          url = "https://home-manager-options.extranix.com/";
        }
        {
          name = "nix-community/manix";
          tags = ["github" "tool" "cli" "repo"];
          keyword = "manix";
          url = "https://github.com/nix-community/manix";
        }
        {
          name = "NixOS/nixpkgs";
          tags = ["nixos" "nix" "pkgs" "packages" "nixpkgs" "repo" "github"];
          keyword = "nixpkgs";
          url = "https://github.com/NixOS/nixpkgs";
        }
        {
          name = "Lunarnovaa/nixconf";
          tags = ["github" "repo" "lunarnova" "dotfiles"];
          keyword = "nixconf";
          url = "https://github.com/Lunarnovaa/nixconf";
        }
        {
          name = "Lunarnovaa/nixbuild";
          tags = ["github" "repo" "lunarnova" "script" "shellscript"];
          keyword = "nixbuild";
          url = "https://github.com/Lunarnovaa/nixbuild";
        }
        {
          name = "NixOS Milestone";
          tags = ["nixos" "nix" "repo" "personal" "lunarnova"];
          keyword = "milestone";
          url = "https://github.com/Lunarnovaa/personal-repo/milestone/2";
        }
        {
          name = "NixOS/nixos-hardware";
          tags = ["framework" "nixos" "nix" "github" "repo"];
          keyword = "nixos-hardware";
          url = "https://github.com/NixOS/nixos-hardware";
        }
        {
          name = "nixpkgs/pkgs/os-specific/linux/nvidia-x11/default.nix at nixos-unstable · NixOS/nixpkgs";
          url = "https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/os-specific/linux/nvidia-x11/default.nix";
        }
      ];
    }

    # Starcraft
    {
      name = "Starcraft";
      toolbar = true;
      bookmarks = [
        {
          name = "Starcraft 2 Co-op";
          tags = ["starcraft 2" "rts" "coop" "guide"];
          keyword = "starcraft 2 coop";
          url = "https://starcraft2coop.com/";
        }
        {
          name = "ZvX Your First Build Order – Part 1 – SC2 Swarm";
          tags = ["starcraft 2" "rts" "versus" "guide" "zerg"];
          keyword = "zvx";
          url = "https://sc2swarm.com/index.php/2019/11/08/beginner-builds-zvx-your-first-build-order-part-1/";
        }
      ];
    }

    # Resources
    {
      name = "Resources";
      toolbar = true;
      bookmarks = [
        {
          name = "Noodletools";
          tags = ["research" "planning" "writing" "productivity"];
          keyword = "noodletools";
          url = "https://my.noodletools.com/web/dashboard.html";
        }
        {
          name = "Cram";
          tags = ["studying" "learning" "productivity"];
          keyword = "flashcards";
          url = "https://www.cram.com/dashboard-flashcards#flashcards";
        }
        {
          name = "TomatoTimer";
          tags = ["timer" "productivity" "adhd" "pomodoro"];
          keyword = "pomodoro";
          url = "https://www.toptal.com/project-managers/tomato-timer#";
        }
        {
          name = "Colemak Academy";
          tags = ["keyboard" "typing" "colemak"];
          keyword = "colemak";
          url = "https://www.colemak.academy/";
        }
        {
          name = "MyBib";
          tags = ["research" "writing" "productivity" "sources"];
          keyword = "bib";
          url = "https://www.mybib.com/#/projects/lwM1wa/citations";
        }
        {
          name = "Covid Resources + Research";
          tags = ["covid" "ableism" "protection" "masks" "distancing"];
          keyword = "covid";
          url = "https://docs.google.com/spreadsheets/d/1M7gy3hW3cZtof3OP3vf5Ddg21yuQFYj44cIm7XPxCLw/edit?gid=1874755414#gid=1874755414";
        }
        {
          name = "PCGaming Wiki";
          tags = ["gaming" "pc" "linux" "wiki"];
          keyword = "pcgaming";
          url = "https://www.pcgamingwiki.com/wiki/Home";
        }
        {
          name = "Finding Jobs for Autistic People";
          tags = ["work" "autism" "jobs"];
          keyword = "jobs";
          url = "https://autisticandunapologetic.com/2021/03/15/finding-jobs-for-autistic-people-a-complete-guide-to-autism-and-employment/";
        }
        {
          name = "Idealist Jobs";
          tags = ["work" "idealism" "radicalism" "jobs"];
          keyword = "idealist";
          url = "https://www.idealist.org/en";
        }
        {
          name = "IMSLP: Free Sheet Music";
          tags = ["free" "music" "pdf"];
          keyword = "imslp";
          url = "https://imslp.org/wiki/Main_Page";
        }
      ];
    }

    # Sources
    {
      name = "Sources";
      toolbar = true;
      bookmarks = [
        {
          name = "Guerilla Gardening";
          bookmarks = [
            {
              name = "How to Start Guerilla Gardening: 8 Steps (with Pictures)";
              url = "https://www.wikihow.life/Start-Guerrilla-Gardening";
            }
            {
              name = "Bay Area Plants For Habitat - California Native Plant Society";
              url = "https://www.cnps.org/gardening/bay-area-plants-habitat-5248";
            }
          ];
        }
        {
          name = "Accomplices Not Allies: Abolishing the Ally Industrial Complex";
          url = "https://www.indigenousaction.org/accomplices-not-allies-abolishing-the-ally-industrial-complex/";
        }
        {
          name = "Anarchy Works!";
          url = "https://anarchy.works/";
        }
        {
          name = "Pocket Guide to Transportation 2023";
          url = "https://rosap.ntl.bts.gov/view/dot/64803";
        }
        {
          name = "Revolution and American Indians: “Marxism is as Alien to My Culture as Capitalism”";
          url = "https://www.filmsforaction.org/news/revolution-and-american-indians-marxism-is-as-alien-to-my-culture-as-capitalism/";
        }
        {
          name = "A (Friendly) Critique of the Degrowth Movement";
          url = "https://medium.com/postgrowth/a-friendly-critique-of-the-degrowth-movement-f0bd2297072d";
        }
        {
          name = "The Degrowth Conundrum";
          url = "https://www.resilience.org/stories/2022-06-20/the-degrowth-conundrum/";
        }
      ];
    }
  ];
}
