{pkgs, ... }:

{
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
     
        
    v = "hx";
    vim = "hx";
    nvim = "hx";
    
    zs = "zellij -s";
    za = "zellij attach";
    zh = "zellij help";
    zks = "zellij kill-session";
    zka = "zellij kill-all-sessions";
    zls = "zellij list-sessions";

    g = "git";
    ga = "git add";
    gb = "git branch";
    gbc = "${gb} --show-current";
    gc = "git commit";
    gca = "${gc} --amend";
    gcm = "${gc} -m";
      
    gco = "git checkout";
      
    gd = "git diff";
    gd- = "git diff HEAD~";
    gdh = "git diff HEAD";
    ghist = "git log --pretty=format:\"%C(yellow)%h%Creset %ad | %Cgreen%s%Creset %Cred%d%Creset %Cblue[%an]\" --date=short";
    gl = "git pull";
    glo = "git log --oneline -n 20";
    glog = "git log";
    
    gp = "git push";
    gs = "git status";

    sb = "source ~/.bashrc";
        
      };

      bashrcExtra = ''
        export PATH="$HOME/.local/bin:$PATH";
        export PATH="$HOME/.dots/scripts:$PATH";
        '';
   };
  };
}
