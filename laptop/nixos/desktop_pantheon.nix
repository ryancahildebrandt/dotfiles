{config, pkgs, ...}:
{
	services.xserver.enable = true;
	services.xserver.desktopManager.pantheon.enable = true;
	services.xserver.displayManager.lightdm.enable = true;
 	services.displayManager.autoLogin.enable = true;
	services.displayManager.autoLogin.user = "ryan";
	services.xserver.xkb.layout = "us";
	services.xserver.xkb.variant = "";
}
