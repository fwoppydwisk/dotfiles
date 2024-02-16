{
  mainBar = {
    layer = "top";
    position = "top";
    height = 27;
    fixed-center = true;
    modules-left = [
      "hyprland/workspaces"
      "custom/notification"
      "tray"
    ];
    modules-center = [
    ];
    modules-right = [
      "battery"
      "cpu"
      "memory"
      "pulseaudio"
      "network"
      "clock"
    ];

    "custon/sep_r" = {
      format = " ";
    };

    "custom/sep" = {
      format = " ";
    };

    "custom/sep_l" = {
      format = " ";
    };

    "custom/notification" = {
      tooltip = true;
      format = "{icon}";
      format-icons = {
        "notification" = "<span foreground='white'><sup></sup></span>";
        "none" = " ";
        "dnd-notification" = "<span foreground='white'><sup></sup></span>";
        "dnd-none" = " ";
      };
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      on-click-middle = "swaync-client -d -sw";
      on-click-right = "swaync-client -C";
      escape = true;
    };

    "hyprland/workspaces" = {
      disable-scroll = false;
      all-outputs = false;
      format = "{icon}";
      "on-scroll-up" = "hyprctl dispatch workspace e+1";
      "on-scroll-down" = "hyprctl dispatch workspace e-1";
      "on-click" = "activate";
      active-only = false;
      format-icons = {
        "1" = "I";
        "2" = "II";
        "3" = "III";
        "4" = "IV";
        "5" = "V";
        "6" = "VI";
        "7" = "VII";
        "8" = "VIII";
        "9" = "IX";
        "10" = "X";
        "11" = "XI";
        "12" = "XII";
      };
    };

    "hyprland/language" = {
      format = "{}";
      format-tr = "TR";
    };

    "hyprland/window" = {
      format = "{}";
      seperate-outputs = true;
    };

    "keyboard-state" = {
      interval = 1;
      numlock = false;
      capslock = false;
      format = "{icon}";
      format-icons = {
        "locked" = " ";
        "unlocked" = "";
      };
    };

    "idle_inhibitor" = {
      format = "{icon}";
      format-icons = {
        "activated" = "";
        "deactivated" = "";
      };
    };

    "tray" = {
      icon-size = 16;
      spacing = 6;
    };

    "clock" = {
      timezone = "Europe/London";
      format = "{:  %H:%M}";
      format-alt = "{:  %H:%M    %d/%m/%Y}";
      tooltip-format = "{:  %H:%M    %d/%m/%Y}";
      today-format = "<span color='#aaaaaa'><b><u>{}</u></b></span>";
      calendar-weeks-pos = "right";
      format-calendar = "<span color='#aaaaaa'><b><u>{}</u></b></span>";
      format-calendar-weeks = "<span color='#aaaaaa'><b><u>{}</u></b></span>";
      format-calendar-weekdays = "<span color='#ffffff'><b>{}</b></span>";
      interval = 10;
      on-click-middle = "kalendar";
    };

    "cpu" = {
      format = " {usage}%";
      tooltip = false;
    };

    "memory" = {
      format = " {}%";
    };

    "battery" = {
      states = {
        "good" = 80;
        "warning" = 30;
        "critical" = 5;
      };
      format = "{icon}{capacity}%";
      format-charging = "  {capacity}%";
      format-plugged = "  {capacity}%";
      format-alt = "{icon}{time}";
      format-icons = ["  " "  " "  " "  " "  "];
    };

    "network" = {
      format-wifi = "  Connected";
      format-ethernet = "  Connected";
      format-disconnected = "  Disconnected";
      tooltip-format-wifi = "{essid} | Signal Strenght: {signalStrength}% | Down Speed: {bandwidthDownBits}, Up Speed: {bandwidthUpBits}";
      tooltip-format = "{ifname} via {gwaddr} ";
      tooltip-format-ethernet = "{ipaddr}  ";
      format-linked = "{ifname} (No IP) ";
      format-alt = "{ifname}: {ipaddr}/{cidr}";
    };

    "pulseaudio" = {
      on-click = "pavucontrol";
      format = "{icon}{volume}%";
      format-icons = {
        "default" = [" " " " " "];
      };
    };

    "disk" = {
      interval = 90;
      format = " {free} (/)";
      tooltip-format = "{used} / {total} ({percentage_used}%)";
      path = "/";
    };

    "custom/power" = {
      format = " ";
      on-click = "wlogout";
    };
  };
}
