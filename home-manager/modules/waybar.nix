
# /home-manager/modules/waybar.nix
# Configures the Waybar status bar.

{ ... }:

{
  programs.waybar = {
    enable = true;
    style = ''
      /* Catppuccin Mocha */
      @define-color base   #1e1e2e;
      @define-color mantle #181825;
      @define-color crust  #11111b;

      @define-color text     #cdd6f4;
      @define-color subtext0 #a6adc8;
      @define-color subtext1 #bac2de;

      @define-color surface0 #313244;
      @define-color surface1 #45475a;
      @define-color surface2 #585b70;

      @define-color overlay0 #6c7086;
      @define-color overlay1 #7f849c;
      @define-color overlay2 #9399b2;

      @define-color blue    #89b4fa;
      @define-color lavender #b4befe;
      @define-color sapphire #74c7ec;
      @define-color sky     #89dceb;
      @define-color teal    #94e2d5;
      @define-color green   #a6e3a1;
      @define-color yellow  #f9e2af;
      @define-color peach   #fab387;
      @define-color maroon  #eba0ac;
      @define-color red     #f38ba8;
      @define-color mauve   #cba6f7;
      @define-color pink    #f5c2e7;
      @define-color flamingo #f2cdcd;
      @define-color rosewater #f5e0dc;

      * {
        font-family: JetBrainsMono Nerd Font, FontAwesome;
        font-size: 13px;
        border: none;
        border-radius: 10px;
      }

      window#waybar {
        background-color: rgba(24, 24, 37, 0.8);
        color: @text;
        transition-property: background-color;
        transition-duration: .5s;
      }

      #workspaces button {
        padding: 0 10px;
        background-color: transparent;
        color: @overlay0;
        min-width: 30px;
      }

      #workspaces button:hover {
        background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.focused {
        color: @blue;
        background-color: @surface0;
      }

      #workspaces button.urgent {
        background-color: @red;
      }

      #mode, #clock, #pulseaudio, #network, #cpu, #memory, #tray {
        padding: 0 10px;
        margin: 3px 3px;
        color: @text;
        background-color: @surface0;
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 35;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "cpu" "memory" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "1"; "2" = "2"; "3" = "3"; "4" = "4"; "5" = "5";
            "6" = "6"; "7" = "7"; "8" = "8"; "9" = "9"; "10" = "10";
            "focused" = "";
            "default" = "";
          };
        };

        "tray" = {
          "icon-size" = 18;
          "spacing" = 10;
        };

        "clock" = {
          "format" = " {:%H:%M:%S  %d/%m/%Y}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "cpu" = {
          "format" = " {usage}%";
          "tooltip" = true;
        };

        "memory" = {
          "format" = " {}%";
        };

        "network" = {
          "format-wifi" = "  {essid} ({signalStrength}%)";
          "format-ethernet" = " {ifname}";
          "format-disconnected" = " Disconnected";
        };

        "pulseaudio" = {
          "format" = "{volume}% {icon}";
          "format-bluetooth" = "{volume}% {icon} ";
          "format-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" ];
          };
        };
      };
    };
  };
}
