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
  color: #1e2030;
}

window#waybar.hidden {
  opacity: 0.0;
}
/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button {
  padding: 0 5px;
  background: transparent;
  color: #494d64;
  border-bottom: 3px solid transparent;
}

#workspaces button.active
#workspaces button.focused {
  background-color: #939ab7;
  border-bottom: 3px solid #494d64;
}

#workspaces button.urgent {
  background-color: #eb4d4b;
}

#mode {
  background: #64727D;
  border-bottom: 3px solid #cad3f5;
}

#custom-notification, #disk, #battery, #cpu, #memory, #temperature, #backlight, #network, #pulseaudio, #custom-media, #tray, #mode, #idle_inhibitor {
  padding: 0 10px;
  margin: 0 2px;
}

#workspaces {
  background-color: #cad3f5;
  margin-right: 2px;
  padding: 0 10px;
}

#clock {
  background-color: #64727D;
  padding: 0 10px;
  margin-left: 2px;
}

#battery {
  background-color: #cad3f5;
}

#battery.charging {
  color: #cad3f5;
  background-color: #26A65B;
}

@keyframes blink {
  to {
    background-color: #cad3f5;
  }
}

#battery.critical:not(.charging) {
  background: #f53c3c;
  color: #cad3f5;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

#cpu {
  background: #a6da95;
}

#memory {
  background: #c6a0f6;
}

#backlight {
  background: #90b1b1;
}

#network {
  background: #f5a97f;
}

#disk {
  background: #2980b9;
  color: #cad3f5;
}


#network.disconnected {
  background: #f53c3c;
}

#pulseaudio {
  background: #eed49f;
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
  color: #1e2030;
  background-color: #8bd5ca;
}
''