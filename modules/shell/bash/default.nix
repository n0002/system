{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.shell.bash;
in
{
  options.n.shell.bash = with types; {
    enable = mkBoolOpt true "Whether or not to enable bash.";
  };

  config = mkIf cfg.enable { 
    n.home.extraOptions =  {
      programs = {
        bash = {
         enable = true; 
         shellAliases = rec { 
         
         "ls" = "ls --color=auto";
         "ll" = "ls -lav --ignore=..";   # show long listing of all except ".."
         "l" = "ls -lav --ignore=.?*";   # show long listing but no hidden dotfiles except "."

         "dra" = "cd ~/dra-cla && ./dra-cla"; # open dra-cla
         "ani" = "cd ~/ani-cli && ./ani-cli";

         "dots" = "cd ~/.dotfiles"; #dotfiles
         "gallery" = "gallery-dl";

         md = "mkdir";
         
         ".."  = "cd .. ";
         "..."  = "cd ../.. ";
         "...."  = "cd ../../.. ";
         "....."  = "cd ../../../.. ";

        #ncg = "nix-collect-garbage"; 
        # nrb = "pushd ~/.dotfiles && sudo nixos-rebuild switch --flake .#laptop && popd";
    
        ns = "nix-shell";
        nb = "nix-build";
        nd = "nix-develop";
        nsp = "nix-shell -p";

        de = "hx ./shell.nix";    
        dn = "echo 'use nix' >> .envrc && direnv allow";     
        df = "echo 'use flake' >> .envrc && direnv allow";     
          
        v = "hx";
        # vim = "hx";
        # nvim = "hx";
    
        zs = "zellij -s";
        za = "zellij attach";
        zh = "zellij help";
        zks = "zellij kill-session";
        zka = "zellij kill-all-sessions";
        zls = "zellij list-sessions";

        g = "git";
        gi = "gh repo create";
        ga = "git add";
        gb = "git branch";
        gbc = "${gb} --show-current";
        gc = "git commit";
        gca = "${gc} --amend";
        gcm = "${gc} -m";
         
        gco = "git checkout";

    
        gre = "git remote";
        gres = "${gre} show";
        grea = "${gre} add";

        gcl = "gh repo clone";
         
    
        gd = "git diff";
        gd- = "git diff HEAD~";
        gdh = "git diff HEAD";
        ghist = "git log --pretty=format:\"%C(yellow)%h%Creset %ad | %Cgreen%s%Creset %Cred%d%Creset %Cblue[%an]\" --date=short";
        gl = "git pull";
        glo = "git log --oneline -n 20";
        glog = "git log";
    
        gp = "git push";
        gpl = "git pull";
        gs = "git status";
    

        sb = "source ~/.bashrc";
           
         };

         bashrcExtra = ''
           export PATH="$HOME/.local/bin:$PATH";
           export PATH="$HOME/.dots/scripts:$PATH";
           eval "$(direnv hook bash)"
           '';
    };
   };
  };
}
