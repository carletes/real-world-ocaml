let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_13;
in
pkgs.mkShell {
  buildInputs = with ocamlPackages; [
    dune_3
    findlib
    ocaml
    ocaml-lsp
    utop

    async
    base
    cohttp-async
    core
    core_bench
    core_extended
    cryptokit
    menhir
    yojson

    # Not available on nixpkgs, apparently:
    #
    # async_graphics

    pkgs.ocamlformat

    # Niv (https://github.com/nmattia/niv), to keep dependencies up-to-date.
    #
    # (`niv` on macOS M1 cannot be installed from 21.05)
    # pkgs.niv

    # Keep this line if you use bash.
    pkgs.bashInteractive
  ];
}
