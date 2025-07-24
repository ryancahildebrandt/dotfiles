{config, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		bash
		bat
		chromium
		eza
		eva
		firefox
		fzf
		gawk
		gnused
		gnugrep
		ghostty
		jq
		kdePackages.falkon
		librewolf
		libsForQt5.kwallet-pam
		micro
		neofetch
		neovim
		pandoc
		proton-pass
		ripgrep
		sd
		starship
		sublime4
		unzip
		ventoy-full
		vivaldi
		wget
		yazi
		yubioath-flutter
		yubico-pam
		zoxide
		zsh
	];

	programs.autojump.enable = true;
	programs.firefox.enable = true;
	programs.fish.enable = true;
	programs.git.enable = true;
	programs.htop.enable = true;
	programs.nano.enable = true;
	programs.starship.enable = true;

	programs.virt-manager.enable = true;
	users.groups.libvirtd.members = ["ryan"];
	virtualisation.libvirtd.enable = true;
	virtualisation.spiceUSBRedirection.enable = true;

	services.pcscd.enable = true;
	
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.permittedInsecurePackages = [
	"openssl-1.1.1w"
	"ventoy-1.1.05"
	];
}


