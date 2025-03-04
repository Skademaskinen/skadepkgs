{pkgs, ...}:

{
    tools.wallpaper = import ./wallpaper { inherit pkgs; };
    tools.banner = import ./banner { inherit pkgs; };
} // import ./external { inherit pkgs; }
