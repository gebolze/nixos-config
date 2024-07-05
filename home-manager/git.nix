{
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
}
