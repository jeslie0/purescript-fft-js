{
  description = "A flake for building PureScript projects.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    ps-overlay.url = "github:thomashoneyman/purescript-overlay";
    # mkSpagoDerivation.url = "/home/james/workspaces/PureScript/mkSpagoDerivation";
    mkSpagoDerivation.url = "github:jeslie0/mkSpagoDerivation";
  };

  outputs = { self, nixpkgs, flake-utils, ps-overlay, mkSpagoDerivation }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ ps-overlay.overlays.default
                       mkSpagoDerivation.overlays.default
                     ];
        };
        dependencies = with pkgs;
          [ purs-backend-es
            esbuild
            spago-unstable
            purs-unstable
            # ps-overlay.packages.${system}.purs-0_15_10
          ];
      in
        {
          packages.default = pkgs.mkSpagoDerivation {
            version = "0.1.0";
            src = ./.;
            spagoLock = ./spago.lock;
            nativeBuildInputs = dependencies;
            buildPhase = "spago bundle --outfile=main.min.js";
            installPhase = "mkdir $out; cp -r main.min.js $out";
          };

          devShell = pkgs.mkShell {
            inputsFrom = [ # self.packages.${system}.default
                         ]; # Include build inputs from packages in
            # this list
            packages = with pkgs;
              [ purescript-language-server-unstable
                watchexec
                purs-tidy
                nodejs
                nodePackages.live-server
              ] ++ dependencies; # Extra packages to go in the shell
          };
        }
    );
}
