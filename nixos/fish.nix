{
  programs.fish = {
    enable = true;
    shellInit = ''
      function fish_prompt
        #powerline-go -error $status -jobs (count (jobs -p)) -newline -cwd-max-depth 4
        set -l prompt (powerline-go -error $status -jobs (count (jobs -p)) -newline -cwd-max-depth 4)
        printf "%s\n" $prompt
      end
    '';
    shellAliases = {
      ls = "lsd";
    };
  };
}
