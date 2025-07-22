{config, pkgs, ...}:
{
	services.xserver.enable = true;
	services.xserver.desktopManager.plasma5.enable = true;
	services.displayManager.sddm.enable = true;
	services.displayManager.autoLogin.enable = true;
	services.displayManager.autoLogin.user = "ryan";
	services.xserver.xkb.layout = "us";
	services.xserver.xkb.variant = "";

	environment.systemPackages = with pkgs; [
		bash
		eva
		fish
		gawk
		git
		gnused
		gnugrep
		jq
		micro
		nano
		nanorc
		tmux
		wget
		zsh
	];
}
