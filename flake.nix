{
  description = "Assignment 1: Recursions";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    typix = {
      url = "github:loqusion/typix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      treefmt-nix,
      typix,
    }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});

      # treefmt: format Markdown and Typst.
      treefmtEval = forAllSystems (
        pkgs:
        treefmt-nix.lib.evalModule pkgs {
          projectRootFile = "flake.nix";
          programs.nixfmt.enable = true; # *.nix
          programs.prettier.enable = true; # *.md
          programs.typstyle.enable = true; # *.typ
          settings.formatter.prettier.includes = [ "*.md" ];
        }
      );

      typixArgs = pkgs: {
        typstSource = "main.typ";
        fontPaths = [ "${pkgs.libertinus}/share/fonts" ];
      };
    in
    {
      # `nix run` targets.
      apps = forAllSystems (
        pkgs:
        let
          typixLib = typix.lib.${pkgs.stdenv.hostPlatform.system};
          guile = pkgs.lib.getExe pkgs.guile;
          mkApp = description: text: {
            type = "app";
            program = pkgs.lib.getExe (pkgs.writeShellScriptBin "app" text);
            meta.description = description;
          };
        in
        {
          hello = mkApp "Scheme: Hello, World!" "exec ${guile} --no-auto-compile ${self}/src/scheme/hello.scm";
          recursions = mkApp "Scheme: Recursions" "exec ${guile} --no-auto-compile ${self}/src/scheme/recursions.scm";
          repl = mkApp "Guile REPL" "exec ${guile}";

          # Typst via Typix: compile-and-copy, and watch-and-recompile.
          build = {
            type = "app";
            program = pkgs.lib.getExe (
              typixLib.buildTypstProjectLocal (
                (typixArgs pkgs)
                // {
                  src = typixLib.cleanTypstSource ./doc;
                  # Copy the compiled PDF next to the source.
                  typstOutput = "doc/main.pdf";
                }
              )
            );
            meta.description = "Typst: build doc/main.pdf into ./doc";
          };
          watch = {
            type = "app";
            # Runs `typst watch` live in the current directory, so the
            # source path is relative to the repo root.
            program = pkgs.lib.getExe (
              typixLib.watchTypstProject (
                (typixArgs pkgs)
                // {
                  typstSource = "doc/main.typ";
                  typstOutput = "doc/main.pdf";
                }
              )
            );
            meta.description = "Typst: watch doc/main.typ and recompile";
          };

          default = self.apps.${pkgs.stdenv.hostPlatform.system}.recursions;
        }
      );

      # `nix build .#doc` -> reproducible PDF using the bundled font.
      packages = forAllSystems (
        pkgs:
        let
          typixLib = typix.lib.${pkgs.stdenv.hostPlatform.system};
        in
        {
          doc = typixLib.buildTypstProject ((typixArgs pkgs) // { src = typixLib.cleanTypstSource ./doc; });
          default = self.packages.${pkgs.stdenv.hostPlatform.system}.doc;
        }
      );

      # `nix fmt` and `nix flake check`.
      formatter = forAllSystems (
        pkgs: treefmtEval.${pkgs.stdenv.hostPlatform.system}.config.build.wrapper
      );
      checks = forAllSystems (pkgs: {
        formatting = treefmtEval.${pkgs.stdenv.hostPlatform.system}.config.build.check self;
      });

      # `nix develop` — Typix shell (typst + fonts) plus guile and treefmt.
      devShells = forAllSystems (
        pkgs:
        let
          typixLib = typix.lib.${pkgs.stdenv.hostPlatform.system};
        in
        {
          default = typixLib.devShell {
            inherit (typixArgs pkgs) fontPaths;
            packages = [
              pkgs.guile
              treefmtEval.${pkgs.stdenv.hostPlatform.system}.config.build.wrapper
            ];
          };
        }
      );
    };
}
