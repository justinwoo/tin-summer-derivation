{ pkgs ? import <nixpkgs> {} }:

let
  src = pkgs.fetchurl {
    url = "https://github.com/vmchale/tin-summer/releases/download/1.21.8/tin-summer-1.21.8-x86_64-unknown-linux-gnu.tar.gz";
    sha256 = "1wywib06c9bq0m36nf9jxwknkv0zisgkcm78p7q25nfr09plcsz2";
  };

  completion = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/justinwoo/sn-completion-bash/daf077e9a3a89e24301ff261720fed7f6d839e72/sn_completion.bash";
    sha256 = "1dg1wlsw82srqr19gbrdza9z8l2jmpmn4kxi3r13xmfhf6bh59q6";
  };

in
pkgs.runCommand "tin-summer" {
  name = "tin-summer";
  inherit src;
} ''
  mkdir -p $out/bin
  tar xf $src -C $out/bin

  COMPLETION=$out/etc/bash_completion.d/sn-completion.bash
  mkdir -p $(dirname $COMPLETION)
  ln -s ${completion} $COMPLETION
''
