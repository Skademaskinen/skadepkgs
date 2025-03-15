{ config, ... }:

{
    skade.users.banner.enable = true;
    skade.plymouth.enable = true;
    users.users.mast3r = config.skade.users.defaultUserConfig "mast3r" // {
        password = "1234";
        extraGroups = ["networkmanager" "wheel" "libvirtd" "tty" "dialout" "input" "audio"];
    };
    users.users.root.password = "1234";

    networking.hostName = "desktop";
    system.stateVersion = "24.11";
}
