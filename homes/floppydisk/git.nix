{
  nixosConfig,
  lib,
  pkgs,
  ...
}: {
  programs.git = {
    extraConfig = {
      init.defaultBranch = "master";
      gpg.format = "ssh";
      gpg."ssh".program = "${pkgs._1password-gui}/bin/op-ssh-sign";
      commit.gpgsign = true;
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDcwriIE5K8SVewvVdgNvmhtAVvJPtMnNkkS4ETi5YgJ";
      push.autoSetupRemote = true;
    };
  };
}
