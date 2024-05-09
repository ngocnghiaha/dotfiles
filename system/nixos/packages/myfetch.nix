{ lib
, stdenv
, fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage rec {
  pname = "myfetch";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "NghiaHaNgoc";
    repo = "myfetch";
    rev = "30c8c5ebb52c362c2cf74ff9e52739576aea1dbc";
    hash = "sha256-kMG08WM49Vy3A25MKYRgJ26I5tQxVIuU3WluPIRBFeE=";
  };

  cargoHash = "sha256-SgmMc8DwwyP/fjnxt/VyeT1D2CubkgcBG7oBhmmUfWg=";
}
