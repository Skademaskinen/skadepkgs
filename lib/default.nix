# library functions, this is completely independant of nixpkgs
{
    eachSystem = drv: builtins.mapAttrs (system: _: drv system) {
        "x86_64-linux" = "";
        "aarch64-linux" = "";
    };
}
