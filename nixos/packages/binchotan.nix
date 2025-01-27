{
  stdenvNoCC,
  lib,
}:
stdenvNoCC.mkDerivation {
  pname = "binchotan";
  version = "1.0";
  src = ./binchotan/.;
 
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
    description = "Binchotan Font";
    platforms = platforms.all;
  };
}
