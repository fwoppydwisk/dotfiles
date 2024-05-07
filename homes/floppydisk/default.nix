{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./packages.nix # home.packages and similar stuff
    ./neovim-flake.nix
    ./ssh.nix
    ./git.nix
  ];

  home = {
    username = "floppydisk";
    homeDirectory = "/home/floppydisk";
    file.".config/lockonsleep/config.sh".source = ./lock.sh;
    file.".config/hypr/hyprpaper.conf".text = ''
      preload = ${/. + ../../misc/wallpapers/ibm.png}
      wallpaper = ,${/. + ../../misc/wallpapers/ibm.png}
      splash = false
    '';
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = import ./hyprland.nix;
  };

  programs.waybar = {
    enable = true;
    settings = import ./waybar.nix;
    style = import ./waybar-style.nix;
  };

  services.udiskie.enable = true;
  services.arrpc.enable = true;
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "lsd";
      ll = "ls -l";
      la = "ls -la";
    };
    history = {
      size = 10000;
      path = "$HOME/.config/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "thefuck"
      ];
      custom = "$HOME/.oh-my-custom";
      #theme = "powerlevel10k/powerlevel10k";
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    initExtra = ''
      source ~/.p10k.zsh
    '';
  };

  programs.git = {
    enable = true;
    userName = "Frankie B.";
    userEmail = "git@diskfloppy.me";
    extraConfig = {
      # commit.gpgsign = true;
      # gpg.format = "ssh";
      # user.signingkey = "~/.ssh/id_ed25519.pub";
      init.defaultBranch = "master";
    };
  };

  programs.irssi = {
    enable = true;
    networks = {
      znc = {
        nick = "floppydisk";
        server = {
          address = "irc.nick99nack.com";
          port = 8888;
          autoConnect = true;
          ssl.enable = false;
        };
      };
    };
  };

  # let HM manage itself when in standalone mode
  programs.home-manager.enable = true;

  # Nicely reload system(d) units when changing configs
  systemd.user.startServices = lib.mkDefault "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
