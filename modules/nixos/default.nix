inputs@{ ... }: {
    desktop = {
        imports = [
            ./desktop
            inputs.home-manager.nixosModules.default
            inputs.nixvim.nixosModules.default
        ];
    };
    server = { 
        imports = [
            ./server
            inputs.rp-utils.nixosModules.default
            inputs.putricide.nixosModules.default
            inputs.nix-velocity.nixosModules.default
            #inputs.folkevognen.nixosModules.default
            inputs.homepage.nixosModules.default
        ];
    };
    default = import ./generic;
}
