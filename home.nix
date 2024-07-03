{ config, pkgs, ... }:
{
  home.username = "gebolze";
  home.homeDirectory = "/home/gebolze";

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # let home manager install and mange itself.
  programs.home-manager.enable = true;
}
