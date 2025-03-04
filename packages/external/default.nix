{pkgs}:

{
    sketch-bot = import ./sketch-bot { inherit pkgs; };
    lavalink = import ./lavalink { inherit pkgs; };
}
