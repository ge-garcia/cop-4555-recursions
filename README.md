# Assignment 1: Recursions

## Development

The document lives in `doc/main.typ` and compiles to `doc/main.pdf`. Source
programs live under `src/<language>/`.

### Dependencies

- [Typst](https://github.com/typst/typst) to build the document.
- The [Libertinus Serif](https://github.com/alerque/libertinus) font. This is
  the preferred document font, but it is optional: `doc/main.typ` falls back to
  Latin Modern Roman, Times New Roman, then DejaVu Serif, so the document still
  compiles if Libertinus is not installed.
- Per-language toolchains for the programs (e.g. [Guile](https://www.gnu.org/software/guile/)
  for Scheme).

### Build

#### With Nix (reproducible, bundles font)

```sh
# Build the PDF into ./doc using the bundled font.
nix run .#build

# Or watch on save
nix run .#watch
```

#### Without Nix

Install Typst (see the [install guide](https://github.com/typst/typst#installation),
e.g. `brew install typst`, `cargo install --locked typst-cli`, or a release
binary), then compile from the repo root:

```sh
typst compile doc/main.typ doc/main.pdf

# Or watch for changes.
typst watch doc/main.typ doc/main.pdf
```

If you have Libertinus installed in a non-standard location, point Typst at it:

```sh
typst compile --font-path /path/to/fonts doc/main.typ doc/main.pdf
```

Without Libertinus, Typst automatically uses the fallback fonts declared in
`doc/main.typ`; the output is styled slightly differently but compiles cleanly.

### Run

The Scheme programs run with Guile:

```sh
# With Nix:
nix run .#hello
nix run .#recursions

# Without Nix (requires guile on PATH):
guile --no-auto-compile src/scheme/hello.scm
guile --no-auto-compile src/scheme/recursions.scm
```

## Requirements (Paraphrased from Canvas)

- Choose three languages from below
  - ML
  - Scheme
  - Haskell
  - Ruby
  - Ada
  - APL
  - PL/I
  - Snobol
  - COBOL
  - Fortran
  - LISP
- For each of the three languages chosen, setup its tooling or use an online
  compiler.
- Using each language, write a "Hello, World!" program
- Comment on the readability of each language (2-3 lines for each), comparing it to the other two languages.
- Write three programs to solve the following three problems using
  recursions
  1. Write a program that reads a decimal number and outputs its
     equivalent binary number.
  2. Write a program that reads a positive integer `n` and displays the
     factorial of the number `!n`.
  3. Write a program that reads a positive integer `n` and finds the value
     of the _nth_ number in the Fibonacci sequence.
- Use each language to solve one problem, for a total of three programs
- For each program, submit a copy of the source code and a screenshot of the
  output
