# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  pkgs,
  lib,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    ./neovim-flake.nix
    ./arrpc.nix
  ];

  home = {
    username = "floppydisk";
    homeDirectory = "/home/floppydisk";
    packages = with pkgs; [
      # Utils
      handbrake
      thunderbird
      picard
      realvnc-vnc-viewer
      rpi-imager
      obs-studio
      yt-dlp
      _1password-gui
      _1password
      git-credential-1password
      firefox-devedition
      inputs.arrpc.packages.${pkgs.system}.arrpc
      rdesktop
      _3llo
      gimp
      qemu
      virt-manager
      exactaudiocopy
      fsv
      lsd
      lsdvd
      thefuck
      zip
      unzip
      notion-app-enhanced
      libresprite
      qbittorrent
      wine
      vifm
      cloudflared
      ansible
      just
      pwgen
      grafx2
      libreoffice-fresh

      # Fetch
      neofetch
      yafetch
      cpufetch
      bunnyfetch
      nitch
      screenfetch
      starfetch

      # DevTools
      github-desktop
      gh
      codeql
      vscode
      jetbrains.ruby-mine
      jetbrains.rider
      jetbrains.phpstorm
      jetbrains.idea-ultimate
      jetbrains.webstorm
      lazygit
      wakatime
      mongodb-compass
      mongosh
      httpie
      ngrok
      mycli
      squirrel-sql
      figma-linux

      # Langs
      openscad
      nodejs_18
      nodePackages.yarn
      nodePackages.ts-node
      nodePackages.pnpm
      php82
      php82Packages.composer
      deno
      python310
      python310Packages.pip
      python310Packages.discordpy
      dotnet-sdk
      jdk17
      maven
      dart
      purescript
      spago

      # Comms
      nheko
      element-desktop
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      caprine-bin
      teamspeak5_client

      # Gaming
      rpcs3
      pcsxr
      pcsx2
      steam
      gzdoom
      minecraft
      dolphin-emu
      prismlauncher
      fceux
      snes9x
      heroic
      openrct2
      osu-lazer-bin

      # Media
      vlc
      libsForQt5.vvave
      tidal-hifi

      # zsh Themes
      zsh-powerlevel10k
    ];
  };

  # Add stuff for your user as you see fit:
  programs = {
    # Enable home-manager
    home-manager.enable = true;

    # Enable z-shell
    zsh = {
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
        theme = "powerlevel10k/powerlevel10k";
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

    # enable git and configure users
    git = {
      enable = true;
      userName = "Frankie B.";
      userEmail = "git@diskfloppy.me";
      extraConfig = {
        # Sign all commits using ssh key
        commit.gpgsign = true;
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/id_ed25519.pub";
        init.defaultBranch = "master";
      };
    };

    irssi = {
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
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "env" = "XCURSOR_SIZE,24";

      "$mod" = "SUPER";

      exec-once = [
        "arRPC"
        "hyprpaper"
        "nm-applet --indicator"
        "waybar"
        "swaync"
        "1password --silent"
      ];

      monitor = [
        "DP-1,1600x900,0x0,1"
        "HDMI-A-1,1280x1024,1600x0,1"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad.natural_scroll = "no";
        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };

      decoration = {
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          new_optimizations = 1;
        };
        drop_shadow = "yes";
        shadow_range = 20;
        shadow_render_power = 5;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;
        animation = [
          "windows, 1, 7, default"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = "yes";
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = false;
      };

      "general:resize_on_border" = "true";

      bindm = [
        # mouse binds
        "ALT,mouse:272,movewindow"
      ];

      binde = [
        # volume controls
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      
      bind = [
        # mute key
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # general shortcuts
        "$mod, Q, exec, kitty"
        "$mod, C, killactive, "
        "$mod, M, exit, "
        "$mod, V, togglefloating, "
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"

        "$mod, E, exec, wlogout -p layer-shell"
        "SUPERSHIFT,n,exec,swaync-client -t -sw"

        # move windows
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"

        # screenshot
        ", Print, exec, grim -l 9 -g \"$(slurp)\" - | wl-copy"

        # rofi
        "$mod, D, exec, rofi -show drun --show-icons"

        # workspace scroll
        "$mod, mouse_down, workspace, e+1"

        # move active window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # switch workspace
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # move window focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ];
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
