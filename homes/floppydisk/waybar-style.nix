''
* {
  border: none;
  border-radius: 0;
  font-family: Roboto,'Font Awesome 5', 'SFNS Display',  Helvetica, Arial, sans-serif;
  font-size: 13px;
  min-height: 0;
}

window#waybar {
  background: rgba(43, 48, 59, 0.5);
  border-bottom: 3px solid rgba(100, 114, 125, 0.5);
  color: #181825;
}

window#waybar.hidden {
  opacity: 0.0;
}
/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button {
  padding: 0 5px;
  background: transparent;
  color: #45475a;
  border-bottom: 3px solid transparent;
}

#workspaces button.active
#workspaces button.focused {
  background-color: #9399b2;
  border-bottom: 3px solid #45475a;
}

#workspaces button.urgent {
  background-color: #eb4d4b;
}

#mode {
  background: #64727D;
  border-bottom: 3px solid #cad3f5;
}

#custom-notification, #disk, #battery, #cpu, #memory, #temperature, #backlight, #network, #pulseaudio, #custom-media, #tray, #mode, #idle_inhibitor, #bluetooth {
  padding: 0 10px;
  margin: 0 2px;
}

#workspaces {
  background-color: #cdd6f4;
  margin-right: 2px;
  padding: 0 10px;
}

#clock {
  background-color: #64727D;
  padding: 0 10px;
  margin-left: 2px;
}

#battery {
  background-color: #cdd6f4;
}

#battery.charging {
  color: #cdd6f4;
  background-color: #26A65B;
}

@keyframes blink {
  to {
    background-color: #cdd6f4;
  }
}

#battery.critical:not(.charging) {
  background: #f53c3c;
  color: #cdd6f4;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

#cpu {
  background: #a6e3a1;
}

#memory {
  background: #cba6f7;
}

#backlight {
  background: #90b1b1;
}

#network {
  background: #fab387;
}

#disk {
  background: #2980b9;
  color: #cdd6f4;
}

#bluetooth {
  background: #74c7ec;
}


#network.disconnected {
  background: #f53c3c;
}

#pulseaudio {
  background: #f9e2af;
  color: #000000;
}

#pulseaudio.muted {
  background: #90b1b1;
  color: #2a5c45;
}

#custom-media {
  background: #66cc99;
  color: #2a5c45;
}

.custom-spotify {
  background: #66cc99;
}

.custom-vlc {
  background: #ffa000;
}

#temperature {
  background: #f0932b;
}

#temperature.critical {
  background: #eb4d4b;
}

#tray {
  background-color: #2980b9;
}

#idle_inhibitor {
  background-color: #2d3436;
}

#idle_inhibitor.activated {
  background-color: #ecf0f1;
  color: #2d3436;
}

#custom-notification {
  color: #181825;
  background-color: #94e2d5;
}
''
