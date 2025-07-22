{config, pkgs, ...}:

let
  orbit-mono = pkgs.callPackage ./packages/orbit.nix {};
  departure-mono = pkgs.callPackage ./packages/departure_mono.nix {};
  eirian = pkgs.callPackage ./packages/eirian.nix {};
  fifteen = pkgs.callPackage ./packages/fifteen.nix {};
  nova-mono = pkgs.callPackage ./packages/nova_mono.nix {};
  sax2 = pkgs.callPackage ./packages/sax2.nix {};
  yuki-code = pkgs.callPackage ./packages/yuki_code.nix {};
  binchotan = pkgs.callPackage ./packages/binchotan.nix {};
in

{
	fonts.enableDefaultPackages = true;
	fonts.packages = with pkgs; [
		nerd-fonts._3270
		cherry
		eunomia
		google-fonts
		hachimarupop
		hanazono
		hermit
		julia-mono
		kode-mono
		lato
		luculent
		maple-mono.NF
		nerd-fonts.martian-mono
		miracode
		mno16
		monaspace
		nerd-fonts.mononoki
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
		open-fonts
		ricty
		sarasa-gothic
		source-han-mono
		source-han-sans
		source-han-serif
		spleen
		sudo-font
		tamsyn
		typodermic-public-domain
		undefined-medium
		nerd-fonts.victor-mono

		orbit-mono
		departure-mono
		eirian
		fifteen
		nova-mono
		sax2
		yuki-code
		binchotan
	];
}
