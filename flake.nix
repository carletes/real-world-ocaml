{
  description = "Real World OCaml reading notes";

  inputs.nixpkgs.url = "nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;
      in
      {
        devShells.default = pkgs.mkShell {
          # Tools.
          nativeBuildInputs = (with ocamlPackages; [
            dune_3
            findlib
            ocaml
            ocaml-lsp
            utop
          ]) ++ (with pkgs; [
            ocamlformat

            # Keep this line if you use bash.
            bashInteractive
          ]);

          # OCaml libraries used here in our code.
          buildInputs = (with ocamlPackages; [
            base
            core
            core_bench
          ]);
        };
      });
}
