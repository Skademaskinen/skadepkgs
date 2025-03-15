{ lib, ... }:

{
    options.skade.plymouth = {
        enable = lib.mkEnableOption false;
    };
}
