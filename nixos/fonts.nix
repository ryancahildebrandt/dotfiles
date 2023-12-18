{config, pkgs, ...}:
{
	fonts.enableDefaultPackages = true;
	fonts.packages = with pkgs; [
		nerdfonts
		_3270font
		cherry
		eunomia
		hachimarupop
		hanazono
		julia-mono
		lato
		mno16
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
		open-fonts
		ricty
		sarasa-gothic
		source-han-mono
		source-han-sans
		source-han-serif
		victor-mono
	];
}


