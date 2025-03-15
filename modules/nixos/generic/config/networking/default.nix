{ lib, ... }:

{
    networking = {
        networkmanager = {
            enable = true;
        };
        useDHCP = lib.mkDefault true;
    };

    services.openssh = {
        enable = true;
        settings.PermitRootLogin = "yes";
        settings.X11Forwarding = true;
    };
}
