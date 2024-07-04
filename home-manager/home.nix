{ config, pkgs, ... }:
{
  home.username = "gebolze";
  home.homeDirectory = "/home/gebolze";

  nixpkgs.config.allowUnfree = true;

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    firefox
    git
    htop
    keepassxc
    lutris
    tree
  ];


  programs.git = {
    enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
    includes = [
      {
        contents = {
          user = {
            name = "Gebolze";
            email = "gebolze@gmail.com";
          };
        };
      }

      {
        condition = "gitdir:~/code/work/";
        contents = {
          user = {
            name = "Markus Burkert";
            email = "m.burkert@cid.com";
          };
        };
      }
    ];
  };

  programs.bash = {
    enable = true;
    historyControl = [ "ignorespace" "ignoredups" ];
    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
    };
  };

  programs.home-manager.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
}
