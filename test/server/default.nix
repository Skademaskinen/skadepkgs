{ config, pkgs, ... }:

{
    virtualisation.vmVariant.virtualisation.graphics = false;

    networking.hostName = "server";
    system.stateVersion = "24.11";

    skade.users.banner.enable = true;

    services.putricide = {
        enable = true;
    };
    services.rp-utils = {
        enable = true;
    };
    services.minecraft = {
        servers = {
            fabric = {
                type = "fabric";
                mods = with config.services.minecraft.instances.mods; [
                    servux
                    fabric-proxy-lite
                ];

            };
            paper = {
                type = "paper";
                plugins = with config.services.minecraft.instances.plugins; [
                    decent-holograms
                    iportal-updated
                ];
            };
        };
        port = 25566;
        eula = true;
    };
    services.homepage = {
        enable = true;
        port = 8000;
    };
    environment.systemPackages = with pkgs; [nmap];
    users.users.mast3r = config.skade.users.defaultUserConfig "mast3r" // {
        password = "1234";
        extraGroups = ["networkmanager" "wheel" "libvirtd" "tty" "dialout" "input" "audio"];
    };
    users.users.root = config.skade.users.defaultUserConfig "root" // {
        password = "1234";
        description = "System administrator";
        isNormalUser = false;
    };
}
