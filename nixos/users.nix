{config, pkgs, ...}:
{
	users.users.ryan = {
		home = "/home/ryan";
		isNormalUser = true;
		description = "ryan";
		shell = pkgs.fish;
		extraGroups = [
			"networkmanager"
			"wheel"
		];
		packages = with pkgs; [
			alacritty
			autojump
			bat
			chromium
			dmenu
			duckdb
			eza
			fd
			firefox
			fzf
			gh
			libreoffice
			libsForQt5.kwallet-pam
			navi
			neofetch
			nnn
			pandoc
			ripgrep
			starship
			sublime4
			thunderbird
			yubioath-flutter
			yubico-pam
		];
	};

	programs.autojump.enable = true;
	programs.firefox.enable = true;
	programs.fish.enable = true;
	programs.git.enable = true;
	programs.htop.enable = true;
	programs.nano.enable = true;
	#programs.hyprland.enable = true;
	#programs.nix-index.enable = true;
	#programs.tmux.enable = true;

	services.pcscd.enable = true;

	#nixpkgs.config.packageOverrides = pkgs:{ nnn = pkgs.nnn.override { withNerdFonts = true; };};
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.permittedInsecurePackages = [
	"openssl-1.1.1w"
	];
}


