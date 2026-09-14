#set page(paper: "us-letter", margin: 1in)

#set text(
  font: (
    "Libertinus Serif",
    "Times New Roman",
  ),
  size: 11pt,
)

#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1")

#align(center)[
  #text(size: 16pt, weight: "bold")[Assignment 1: Recursions]

  #smallcaps[ Principles of Programming Languages  ] \
  Shirina Daniel, Gabriel Garcia, Marcelo Hernandez \
  #datetime.today().display()
]

The three languages chosen were Ada, Scheme, and Haskell.

= Ada

// TODO: Ada section.
//
// - Hello world snippet (see the Scheme section for the pattern).
// - The recursion program chosen for Ada.
// - Screenshots: doc/screenshots/ada-code.png and ada-output.png.
// - 2-3 lines on readability, comparing Ada to Scheme and Haskell.
//
// #figure(
//   grid(
//     columns: (auto, auto),
//     column-gutter: 1em,
//     align: bottom + center,
//     image("screenshots/ada-code.png", height: 6cm),
//     image("screenshots/ada-output.png", height: 6cm),
//   ),
//   caption: [Ada source code (left) and program output (right).],
// )

= Haskell

// TODO: Haskell section.
//
// - Hello world snippet (see the Scheme section for the pattern).
// - The recursion program chosen for Haskell.
// - Screenshots: doc/screenshots/haskell-code.png and haskell-output.png.
// - 2-3 lines on readability, comparing Haskell to Scheme and Ada.
//
// #figure(
//   grid(
//     columns: (auto, auto),
//     column-gutter: 1em,
//     align: bottom + center,
//     image("screenshots/haskell-code.png", height: 6cm),
//     image("screenshots/haskell-output.png", height: 6cm),
//   ),
//   caption: [Haskell source code (left) and program output (right).],
// )

= Scheme

Hello world in scheme is quite simple, and can be run directly from the REPL
environment:

```scheme
(display "Hello, world from Scheme!\n")
```

With the recursion program chosen (decimal number to binary), we can see more of
the unique properties of Scheme and better compare it against the other two
languages:

#figure(
  grid(
    columns: (auto, auto),
    column-gutter: 1em,
    align: bottom + center,
    image("screenshots/scheme-code.png"),
    image("screenshots/scheme-output.png"),
  ),
  caption: [Scheme source code (left) and program output (right).],
)

Expressing "this input is a positive integer" is pretty meaningful in terms of
language philosophy. In Ada, you can express this via strong type safety (e.g. a
parameter `(N: Natural)`). In Scheme, being dynamically typed, enforcing that
sort of constraint is only possible at run time with an explicit error. This
trade off is a bit of a theme with Scheme, high expressivity at the cost of
readability. Similarly, Haskell is also statically typed and would express the
constraint in the type like in Ada, but we see more similarity between the two
in terms of functional-first in general.
