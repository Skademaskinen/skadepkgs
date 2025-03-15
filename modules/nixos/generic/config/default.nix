{config, pkgs, lib, ...}:

{
    imports = [
        ./networking
        ./git
        ./nix
        ./locale
        ./zsh
    ];
    users.motd = lib.mkIf config.skade.users.banner.enable (builtins.readFile (import ../../../../packages/banner { 
        inherit pkgs;
        name = config.networking.hostName; 
    }));
}
