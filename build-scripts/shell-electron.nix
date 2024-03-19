# SPDX-FileCopyrightText: Atlas Engineer LLC
# SPDX-License-Identifier: BSD-3-Clause

# This file is meant to be used with the nyxt/electron system. Use this
# file to open a nix shell with the required dependencies to run SBCL
# and load nyxt/electron.

{ pkgs ? import <nixpkgs> {} } :
with builtins;
let inherit (pkgs) stdenv; in
with pkgs;
stdenv.mkDerivation {
  name = "nyxt-dev";

  nativeBuildInputs = [
    pkgs.libressl.out
    pkgs.libfixposix.out
    pkgs.sbcl
    pkgs.sqlite.out
    pkgs.pkg-config.out
  ];

  buildInputs = [ electron ];

  LD_LIBRARY_PATH = with lib; "${makeLibraryPath [ pkgs.libfixposix.out
                                                   pkgs.sqlite.out
                                                   pkgs.libressl.out ]};";


}
