{
  inputs,
  config,
  pkgs,
  ...
}: let
  inherit (inputs) self;
  homeManagerModules = with inputs.self.homeManagerModules; [
    home
    common

    #programs.neovim
    programs.games
    programs.vscode
    #programs.kitty
    programs.alacritty
    programs.direnv

    services.arrpc
    services.easy-effects
  ];
in {
  imports = homeManagerModules;

  home = {
    file.".local/share/user-places.xbel".source = ./user-places.xbel; # respect custom places dir in file managers

    sessionVariables = {
      LIBVA_DRIVER_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";
      WLR_DRM_NO_ATOMIC = "1";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __GL_GSYNC_ALLOWED = "1";
      __GL_VRR_ALLOWED = "1";
      #__GL_SYNC_TO_VBLANK = "0";
    };

    packages = with pkgs; [
      brave
      kate
      webcord-vencord
      spotify
      playerctl
      obs-studio

      gwenview
      gimp
      vlc

      whatsapp-for-linux
      appimage-run
      obsidian
    ];
  };

  xdg.userDirs = {
    enable = true;

    desktop = "/mnt/LinuxExpansion/Places/Desktop";
    documents = "/mnt/LinuxExpansion/Places/Documents";
    download = "/mnt/LinuxExpansion/Places/Downloads";
    music = "/mnt/LinuxExpansion/Places/Audio";
    pictures = "/mnt/LinuxExpansion/Places/Images";
    videos = "/mnt/LinuxExpansion/Places/Videos";

    extraConfig = {
      XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
    };
  };

  gtk.gtk3.bookmarks = [
    "file://${config.xdg.userDirs.desktop}"
    "file://${config.xdg.userDirs.documents}"
    "file://${config.xdg.userDirs.download}"
    "file://${config.xdg.userDirs.music}"
    "file://${config.xdg.userDirs.pictures}"
    "file://${config.xdg.userDirs.videos}"
  ];

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      #"wlr-randr --output HDMI-A-1 --off && sleep 1 && wlr-randr --output HDMI-A-1 --on --pos 1921,0"
    ];

    monitor = [
      "DP-2, 1920x1080@144, 0x0, 1, bitdepth,10"
      ", preferred, auto, 1, bitdepth, 10"
    ];

    workspace = [
      "1, monitor:DP-2, default:true"
      "2, monitor:DP-2"
      "3, monitor:DP-2"
      "4, monitor:DP-2"
      "5, monitor:DP-2"
      "6, monitor:DP-2"
      "7, monitor:DP-2"
      "11, monitor:HDMI-A-1, default:true"
      "12, monitor:HDMI-A-1"
      "13, monitor:HDMI-A-1"
      "14, monitor:HDMI-A-1"
      "15, monitor:HDMI-A-1"
      "16, monitor:HDMI-A-1"
      "17, monitor:HDMI-A-1"
    ];

    general.allow_tearing = true;

    misc = {
      no_direct_scanout = false;
      vrr = 1;
    };
  };
}
