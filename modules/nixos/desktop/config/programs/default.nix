{
    imports = [
        ./plymouth
    ];

    xdg.portal.config.common.default = "*";
    programs.direnv = {
        enable = true;
        enableZshIntegration = true;
    };
}
