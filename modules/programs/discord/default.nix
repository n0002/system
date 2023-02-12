 {pkgs, inputs, ...}: {
 
   home.packages = [
    inputs.webcord.packages.${pkgs.system}.default
    # ...
  ];
 }