# How the type checker works now when checking integers
Currently the Spade-compiler adds constraints to integers (some literature refer to it as "bag of constraints") - which is a simple way of implementing generics. The method works well but has some completeness problems, implementing a bi-directional type checker could fix these issues if done properly - or simply trying all permutations of the additions (but this would be detrimental to the time-complexity of the compiler).

When an addition is visited the program simply adds a constraint to the resulting type-variable which communicates the size, a constraint coupling the addition-expression type-variable is also added. This creates a relationship between the two type variables. Here is a simple sketch of the idea, only mentioning the type variables, with constraints in angle brackets.
```
Visiting: a + x
(a + x) = a + 1
a = (a + x) - 1
x = (a + x) - 1
```

Reasoning a bit more about these constraints, it's clear where the directional city comes from. The directionality has to exist since the type-checker is too eager to increase the bit-size.

## Example of directionality and the trouble with completeness
Compiles
```
fn f(a: int<3>) -> int<4> {
  let c: int<2> = 0;
  let d: int<2> = 0;
  c + d + a
}
```

Does not compile:
```
fn f(a: int<3>) -> int<4> {
  let c: int<2> = 0;
  let d: int<2> = 0;
  a + c + d
}
```

## (1) Separate solver for integer sizes
The constraints for the integers could be split into a separate list of constraint with different kinked type-variables. These variables could then be minimized/optimized/checked in a separate pass. This would cause little change to the type-checking in large but might cause technical debt later. It might also be a good idea if the optimization passes are to be more flexible, since this would make it easier to change the implementation of the integer-bounds-checking in the codebase.

The flow of the compiler would look like this then:
```
 - Lexer/Parse/HIR
 - Type check, creating artifacts for integers
 - Integer check, optimizing and minimizing the sizes where it's applicable
 - Other optimizations/Codegen/Final stages
```

In list form:
 - *PRO*: I think this is the way to do it since it's the most relevant for the thesis
 - *PRO*: Easy to implement into the codebase
 - *PRO*: Allows adding more of these integer-bounds-checking implementations which lets us compare different versions in the thesis
 - *PRO*: Adds a natural place for optimizing things like fix-point additions later on
 - *CON*: It adds another layer of abstraction
 - *CON*: There might be a lot of duplication of logic since the typechecker basically does the same thing
 - *CON*: More code

## (2) Make the current type-checker bi-directional
The constraint checking of the integers can be checked from two directions - since we know the return type from a function we could change the way the typechecker works to try to solve the problems it faces by generalizing and re-trying. This might make future language-features simpler or harder. It might also not be advisable to have me re-write the entire type checker.

This would not change the layout of the type-checker.

In list form:
 - *PRO*: Probably the cleaner solution
 - *PRO*: Makes more sophisticated language features easier to implement
 - *PRO*: Solves other type-checking problems
 - *CON*: Adds more complexity in the type-checker than is needed
 - *CON*: Not really the focus of the thesis
 - *CON*: I don't think I should be the person that knows how the type-checker works
 - *CON*: Potentially more work
 - *CON*: Large changes in the codebase

