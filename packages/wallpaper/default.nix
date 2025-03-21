{ pkgs, wallpaper ? pkgs.fetchurl {
    
    url = "https://img.goodfon.com/original/3840x2160/c/8d/anime-mech-fate.jpg";
    hash = "sha256-my/d2+nKKj+XCtgS5hC2mKFb7yIvVNg9P1IelPl9lRY=";
}}: let
    env = pkgs.python312.withPackages (py: with py; [
        pillow
        cairosvg
    ]);
    images = [
        "${pkgs.nixos-artwork.wallpapers.simple-dark-gray-bootloader}/share/backgrounds/nixos/nix-wallpaper-simple-dark-gray_bootloader.png"
        "${pkgs.fetchFromGitHub {
            owner = "WillPower3309";
            repo = "swayfx";
            rev = "0.5";
            sha256 = "sha256-gdab7zkjp/S7YVCP1t/OfOdUXZRwNvNSuRFGWEJScF8=";
        }}/assets/swayfx_logo.svg"
        "${pkgs.fetchFromGitHub {
            owner = "f-klubben";
            repo = "logo";
            rev = "master";
            sha256 = "sha256-ep6/vzk7dj5InsVmaU/x2W1Lsxd4jvvwsyJzLgQJDEE=";
        }}/logo.svg"
    ];
in pkgs.stdenv.mkDerivation {
    name = "wallpaper.png";
    pname = "wallpaper.png";
    src = ./.; 
    installPhase = ''
        ${env.interpreter} $src/overlay.py ${wallpaper} ${builtins.concatStringsSep " " images} $out
    '';
}
