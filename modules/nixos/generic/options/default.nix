{ lib, ... }:

{
    options.skade = {
        users.banner.enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
        };
    };
}
