{ pkgs, ... }: {
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  environment.systemPackages = with pkgs; [
    picom
    polybar
    feh
    variety
    rofi
    dunst
    rofi-emoji
    brightnessctl
    pavucontrol
    rofi-bluetooth
    alsa-utils
  ];
}
