{config, pkgs, ...}:
{
	services.xserver.enable = true;
	services.xserver.desktopManager.plasma5.enable = true;
	services.xserver.displayManager.sddm.enable = true;
	services.xserver.displayManager.autoLogin.enable = true;
	services.xserver.displayManager.autoLogin.user = "ryan";
	services.xserver = {
		layout = "us";
		xkbVariant = "";
	};

	environment.systemPackages = with pkgs; [
		bash
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
