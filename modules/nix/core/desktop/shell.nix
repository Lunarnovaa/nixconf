{pkgs, ...}: {
  environment.systemPackages = [pkgs.nushell];
  users.users.lunarnova.shell = pkgs.nushell;
}
