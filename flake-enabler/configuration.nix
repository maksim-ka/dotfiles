{ config, pkgs, ... }:

{
  imports = [ 
    <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>
    .modules/flake.nix
  ];

}
