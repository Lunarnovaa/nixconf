{inputs, ...}: {
  environment.systemPackages = [inputs.agenix.packages.x86_64-linux.default];
  age.secrets = {
    userPassword.file = ./../../../../secrets/userPassword.age;
    wifiPassword.file = ./../../../../secrets/wifiPassword.age;
  };
  age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];
}
