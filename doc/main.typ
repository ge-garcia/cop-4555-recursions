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
    columns: (auto, auto),
    column-gutter: 1em,
    align: bottom + center,
    image("screenshots/ada-code.png"), image("screenshots/ada-output.png"),
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

Like Scheme, Haskell has a REPL (GHCi) that evaluates expressions directly, so
hello world can be a one-liner; compiled with GHC, it is defined as a `main`
action:

```haskell
main :: IO ()
main = putStrLn "Hello, world from Haskell!"
```

With the recursion program chosen (Fibonacci), we can see more of the unique
properties of Haskell and better compare it against the other two languages:

#figure(
  grid(
    columns: (auto, auto),
    column-gutter: 1em,
    align: bottom + center,
    image("screenshots/haskell-code.png"), image("screenshots/haskell-output.png"),
  ),
  caption: [Haskell source code (left) and program output (right).],
)

The function definition is a direct transcription of the mathematical
recurrence: each case of the recursion is its own equation, selected by pattern
matching on the argument rather than by an explicit `if/else` like Ada's. The
type signature `fib :: Integer -> Integer` states up front that the function
takes one integer and returns one, though `Integer` is unbounded like Scheme's
numbers, so the "positive input" constraint is still enforced by a runtime
check rather than by the type the way Ada's `1 .. 12` subtype does it.

In comparing the three, Haskell reads closest to mathematics: shorter and more
declarative than Ada, with none of Scheme's parentheses, though its dense
infix notation and operator-heavy style (`fib (n - 1) + fib (n - 2)`) can be
intimidating in the same way Scheme's symbols are. Its types give it the
self-documenting quality of Ada while staying functional-first like Scheme,
but the constraint checking lives at runtime with Scheme rather than in the
type system with Ada.

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
    image("screenshots/scheme-code.png"), image("screenshots/scheme-output.png"),
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
