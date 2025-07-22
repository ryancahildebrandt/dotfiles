{
  stdenvNoCC,
  lib,
}:
stdenvNoCC.mkDerivation {
  pname = "orbit-mono";
  version = "1.0";
  src = ./orbit/.;
 
  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    mkdir -p $out/share/fonts/opentype/
    if [ -d "$src/fonts" ]; then
        cp -r $src/fonts/*.ttf $out/share/fonts/truetype/
        cp -r $src/fonts/*.otf $out/share/fonts/opentype/
    else
      echo "No fonts found in $src/fonts"
      exit 0
    fi
  '';
 
  meta = with lib; {
    description = "Orbit Mono Font";
    platforms = platforms.all;
  };
}
