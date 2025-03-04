{
    description = "NixOS modules and packages for personal use";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        # i would use the // operator together with builtins.mapAttrs, but noooo, inputs are cursed
        homepage = {
            url = "github:Skademaskinen/homepage";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        rp-utils = {
            url = "github:Skademaskinen/RP-Utils";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        putricide = {
            url = "github:Skademaskinen/Putricide";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-velocity = {
            url = "github:Skademaskinen/nix-velocity";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        folkevognen = {
            url = "github:Skademaskinen/Folkevognen";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ nixpkgs, ... }: let
        lib = import ./lib;
    in {
        packages = lib // lib.eachSystem (system: {
            homepage = inputs.homepage.packages.${system}.default;
            rp-utils = inputs.rp-utils.packages.${system}.default;
            putricide = inputs.putricide.packages.${system}.default;
            folkevognen = inputs.folkevognen.packages.${system}.default;
        } // import ./packages { pkgs = import nixpkgs { inherit system; }; });

        nixosModules = import ./modules/nixos;
        homeManagerModules = import ./modules/home;
    };
}
