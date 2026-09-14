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

Hello world in Ada cannot be run directly from a REPL; Ada is a compiled
language, so even a one-line program must be defined as a procedure and built
with a toolchain like GNAT:

```ada
with Ada.Text_IO; use Ada.Text_IO;

procedure Hello is
begin
   Put_Line ("Hello, world from Ada!");
end Hello;
```

With the recursion program chosen (factorial), we can see more of the unique
properties of Ada and better compare it against the other two languages:

#figure(
  grid(
    columns: 1,
    row-gutter: 1em,
    align: center,
    image("screenshots/ada-code.png", height: 6cm),
    image("screenshots/ada-output.png", height: 3cm),
  ),
  caption: [Ada source code (top) and program output (bottom).],
)

Because Ada is statically typed, the constraint that the input is a positive
integer is expressed in the type itself: the parameter is declared as a
subtype of `Integer` restricted to `1 .. 12`, so an out-of-range read is
rejected at runtime by the language's own constraint checking rather than by
hand-written error code the way it is in Scheme. This moves a lot of the
"documentation" of the program into the compiler.

In comparing the two, Scheme is much more dense and therefore shorter, but Ada
relies on the English language rather than symbols which makes it much more
readable from a newcomer's standpoint. Compared to Haskell, which would express
the constraint in the type as well, Ada feels much more imperative-first: we
write the recursion as an explicit `if/else` function call rather than leaning
toward a declarative, functional style.

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
