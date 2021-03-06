{ cabal, mtl, fetchpatch, alex, happy }:

cabal.mkDerivation (self: {
  pname = "BNFC";
  version = "2.6.0.3";
  sha256 = "0i38rwslkvnicnlxbrxybnwkgfin04lnr4q12lcvli4ldp2ylfjq";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ mtl ];
  buildTools = [ alex happy ];
  patches = [ (fetchpatch { url = "https://github.com/BNFC/bnfc/pull/3.patch"; sha256 = "1i87crwva5m3v095lv3zxs38pr6nmly58krlr6sxpwnakpr0pxsp"; }) ];
  patchFlags = "-p2";
  preConfigure = "runhaskell Setup.lhs clean";
  meta = {
    homepage = "http://bnfc.digitalgrammars.com/";
    description = "A compiler front-end generator";
    license = "GPL";
    platforms = self.ghc.meta.platforms;
    maintainers = [
      self.stdenv.lib.maintainers.andres
      self.stdenv.lib.maintainers.simons
    ];
  };
})
