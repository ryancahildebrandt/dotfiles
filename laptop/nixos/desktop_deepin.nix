{config, pkgs, ...}:
{
	services.xserver.enable = true;
	services.xserver.desktopManager.deepin.enable = true;
	services.displayManager.sddm.enable = true;
 	services.displayManager.autoLogin.enable = true;
	services.displayManager.autoLogin.user = "ryan";
	services.xserver.xkb.layout = "us";
	services.xserver.xkb.variant = "";
}
