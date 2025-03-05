{config, pkgs, lib, ...}:

{
    users.motd = lib.mkIf config.skade.users.banner.enable (builtins.readFile (import ../../../../packages/banner { 
        inherit pkgs;
        name = config.networking.hostName; 
    }));
}
