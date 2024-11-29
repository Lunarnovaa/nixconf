{inputs, ...}: {
  environment.systemPackages = [inputs.agenix.packages.x86_64-linux.default];
  age.secrets = {
    userPassword.file = ../../../../secrets/userPassword.age;
    wifiPassword.file = ../../../../secrets/wifiPassword.age;
    spotifyPassword.file = ../../../../secrets/spotifyPassword.age;
    spotifyClientID.file = ../../../../secrets/spotifyClientID.age;
  };
  age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];
}
