{pkgs, ...}: {
  # Enable functionality for non-Nix binaries
  environment.systemPackages = with pkgs; [nixd];
}
