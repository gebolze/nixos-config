{
  programs.bash = {
    enable = true;
    historyControl = [ "ignorespace" "ignoredups" ];
    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
    };
  };  
}
