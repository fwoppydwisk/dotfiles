{
  "env" = "XCURSOR_SIZE,24";

  "$mod" = "SUPER";

  exec-once = [
    "arRPC"
    "hyprpaper"
    "nm-applet --indicator"
    "waybar"
    "swaync"
    "1password --silent"
    "blueman-applet"
  ];

  monitor = [];

  windowrulev2 = [
    "float, title:^(Picture-in-Picture)$"
    "pin, title:^(Picture-in-Picture)$"
    "move 67% 72%, title:^(Picture-in-Picture)$"
    "size 33% 28%, title:^(Picture-in-Picture)$"
  ];

  windowrule = [
    "float,^(blueman-manager)$"
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
    "col.active_border" = "rgb(f38ba8)";
    "col.inactive_border" = "rgb(313244)";
    layout = "dwindle";
  };

  decoration = {
    blur = {
      enabled = true;
      size = 3;
      passes = 1;
      new_optimizations = 1;
    };
    drop_shadow = "no";
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

  bindl = [
    ",switch:on:Lid Switch,exec,${/. + ../../misc/scripts/lidclose.sh}"
    ",switch:off:Lid Switch,exec,${/. + ../../misc/scripts/lidopen.sh}"
  ];

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

    # brightness controls
    ", XF86MonBrightnessUp, exec, brightnessctl s +20%"
    ", XF86MonBrightnessDown, exec, brightnessctl s 20%-"

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

    # maximize window
    "$mod, return, fullscreen, 0"

    # screenshot
    ", Print, exec, grim -l 9 -g \"$(slurp)\" - | wl-copy"

    # wofi
    "$mod, D, exec, wofi --show=drun -G"

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
}
