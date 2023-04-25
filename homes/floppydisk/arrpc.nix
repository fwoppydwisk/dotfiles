{
  lib,
  inputs,
  pkgs,
  ...
}: with lib; let 
  arRPC = inputs.arrpc.packages.${pkgs.system}.default;

  mkService = lib.recursiveUpdate {
    Unit.PartOf = ["graphical-session.target"];
    Unit.After = ["graphical-session.target"];
    Install.WantedBy = ["graphical-session.target"];
  };
  home.packages = [pkgs.webcord-vencord];
in {
  systemd.user.services = {
    arRPC = mkService {
      Unit.Description = "arRPC systemd service";
      Service = {
        ExecStart = "${lib.getExe arRPC}";
        Restart = "always";
      };
    };
  };
}

