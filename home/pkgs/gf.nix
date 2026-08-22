{
  lib,
  stdenv,
  fetchFromGitHub,
  libx11,
  freetype,
  pkg-config,
}:
stdenv.mkDerivation {
  pname = "gf";
  version = "unstable-2026-08-16";
  src = fetchFromGitHub {
    owner = "nakst";
    repo = "gf";
    rev = "1c04ed95d45d49fb4b06cbc620c61acd58818977";
    hash = "sha256-42uB2HVJaEXgjA+/iUrML6biUOqj9b7mCQfSrj/nKvw=";
  };
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    libx11
    freetype
  ];
  buildPhase = ''
    runHook preBuild
    g++ gf2.cpp -o gf2 -O2 -DUI_FREETYPE \
      $(pkg-config --cflags freetype2) \
      -lX11 -pthread $(pkg-config --libs freetype2)
    runHook postBuild
  '';
  installPhase = ''
    runHook preInstall
    install -Dm755 gf2 $out/bin/gf2
    runHook postInstall
  '';
}
