{ ... }:
{
  programs = {
    zoxide.enable = true;
    zathura = {
      enable = true;
      options = {
        recolor-lightcolor = "rgba(0, 0,0,1)";
        selection-clipboard = "clipboard";
        default-bg = "rgba(0,0,0,0.5)";
        recolor-darkcolor = "white";
        recolor = "true";
        guioptions = "none";
        selection-notification = "false";
      };
    };
  };
  services = {
    syncthing = { enable = true; tray.enable = true; };
  };
}
