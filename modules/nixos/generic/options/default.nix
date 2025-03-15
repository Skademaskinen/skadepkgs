{ lib, pkgs, ... }:

{
    options.skade = {
        users.banner.enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
        };
        users.defaultUserConfig = lib.mkOption {
            type = lib.types.anything;
            default = username: {
                isNormalUser = lib.mkDefault true;
                description = lib.mkDefault "${username} user account";
                shell = lib.mkDefault pkgs.zsh;
                packages = lib.mkDefault [pkgs.bat pkgs.fastfetch];
            };
        };
    };
}
