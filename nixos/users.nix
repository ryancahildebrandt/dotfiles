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
			dmenu
			duckdb
			eza
			firefox
			gh
			libreoffice
			neofetch
			nnn
			starship
			sublime4
			thunderbird
			yubico-pam
			libsForQt5.kwallet-pam
		];
	};

	programs.autojump.enable = true;
	programs.firefox.enable = true;
	programs.fish.enable = true;
	programs.git.enable = true;
	programs.htop.enable = true;
	programs.nano.enable = true;
	#programs.nix-index.enable = true;
	#programs.tmux.enable = true;

	#nixpkgs.config.packageOverrides = pkgs:{ nnn = pkgs.nnn.override { withNerdFonts = true; };};
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.permittedInsecurePackages = [
	"openssl-1.1.1w"
	];
}


