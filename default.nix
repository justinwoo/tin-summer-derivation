{ pkgs ? import <nixpkgs> {} }:

let
  src = pkgs.fetchurl {
    url = "https://github.com/vmchale/tin-summer/releases/download/1.21.8/tin-summer-1.21.8-x86_64-unknown-linux-gnu.tar.gz";
    sha256 = "1wywib06c9bq0m36nf9jxwknkv0zisgkcm78p7q25nfr09plcsz2";
  };

in pkgs.runCommand "tin-summer" {
  name = "tin-summer";
  inherit src;
} ''
  mkdir -p $out/bin
  tar xf $src -C $out/bin
''
