# Try 1
In this attempt the `ConstraintExpr` struct was changed to denote `<=`-constraints on `Range`s. This caused problems with other inference logic in the typechecker.

This didn't work. I severed too many connections in the compiler for it to infer. The idea of propagating the constraints by variable substitution isn't a super bad idea - but it does throw away information and might cause other issues.

Problems:
   - Changed too much
   - The system is good as is I don't need to change that
   - Something is off with ranges


I should look into:
    - How does the variables interact with constants
    - How can I get input from the program - I don't get the known sizes right now which makes it REALLY hard
    - Can I be less extreem in my changes?
    - Change to floats? Will have correctness issues, right?
    - I have a problem - and that's with representing the range and the size in bytes at once - I should pick one and use that

```
74c966a (HEAD -> the-simplest-implementation) Try throwing more expressions at it
e2e57ed Get agressive and implement a sat-solver
7800560 Get some hybris and change way too much
d0fd736 (origin/flag-for-aa, flag-for-aa) Turns out it wasn't unused
```

# Try 2

I learned from Try 1 and tried to add a new set of constraints for this integer size. These constraints were then solved at the same time as the current `Requirement`s. The inference happened to late, which caused problems with the `mir_lowering` - and potentially showed a bug in the typechecker.

Problems:
   - I need equation context for the inference to work - I need a third thing
   - Not happy about adding this amount of complexity but I think it's fine
   - I also need IA to be inserted somewhere

```
3d92c0e (HEAD -> the-second-simplest-thing) Doesn't work either, I need the full equations
d0fd736 (origin/flag-for-aa, flag-for-aa) Turns out it wasn't unused
```

# Try 3
Added a new kind of constraint - but this won't fly since it doesn't interact with the other constraints. I actually have equivalence constraints - and I need equivalence constraints for this to actually work (otherwise I don't get enough information).

Problems:
    - Feels complicated
    - Doesn't interact with current constraints
    - It's directional and hard to write these constraints. With equivalence I get enough constraints to solve the equations correctly.
    - I have to know the size of sub-expressions and have to change the code to reflect that.

```
83d1da4 (HEAD -> the-third-simplest-with-equations) Try it again
a3cb372 Add size equations
d0fd736 (origin/flag-for-aa, flag-for-aa) Turns out it wasn't unused
```

# Try 4
Added extra variables that limited the range, but equality is a must. Return the range variables from expressions aided the inference quite a bit. Ideally the type-checker wouldn't be written like this.

Pros:
    - More stable and interacts with the current system
    - Faster to implement
    - Less changes to the code

Problems:
    - Will require explicit types in some cases
    - Doesn't allow for a stage of minimization of Word-lengths since the equations are fixed under equality
            - mir_type_lowering::expr_type
    - Large refactor footprint

# Try 5
Added extra variables that limited the range, equality is still a must. Didn't refactor the code to send the range.

This approach didn't work well since a lot of range information is lost due to how unification works. Either the unification needs changing or we do a better approach.

Problems:
    - Didn't work well
        - Failed to propagate type information and multiple requirements were lost leaving variables under-restrained

```
d293806
```

# Try 6
Same as try 1 and 2 - but pitched differently.

# Try 7?
We could completely change the integer type to a set of all possible values, this is possible to encode into other known HM-typed languages. This approach would also change from constraints to requirements which play a different roll in the type-checker and are not treated the same. But I'm thinking we're limited by the current type-inference.

# The best solution
Make the typechecker more powerfull by going to something at least as strong as a Bi-directional typechecker. We know stronger type-systems easily can encode the properties we care about:
```
add :: Int a -> Int b -> Int (Add a b)

sub :: Int a -> Int b -> Int (Sub a b)

-- This needs to be more complex to work with Interval Arithmetic - but note how AA is hard to encode here (and encoding AA is going to be hard if it's not done as a seperate step since it largely depends on variables that are the same be the same for optimal results) 
mul :: Int a -> Int b -> Int (Mul a b)

-- The rest of the IA operations are now trivial
```
We know this is possible since there are type-level integers in Haskell which has a more powerful typechecker (https://hackage.haskell.org/package/type-level-numbers).
An example of something I think might be enough is a Bidirectional Typechecker - this adds more features like "completeness" in the typesystem and better support for generics (which is what is needed now). Though, it's possible to encode this behavior in a HM type system I doubt it's practical. 
Ofcourse, in a perfect world we would go directly to something like System-F and hide most of the functionality with the syntax of the language - that way we could encode anything we want in the typesystem. The main thing Spade would be giving up is error messages - but if the language is constrained enough it could probably be worked around.

We can't do a separate unit for inferring the integer sizes - the type system expects the integer sizes to be known after we've typechecked (and Hindley Milner never lets us roll back a rule application). This makes it hard to patch this kind of functionality into the type system after it was integrated. But ideally we want better support for sub-typing which is why moving to a bi-directional type-checker would be a good idea.

I think the best approach for more sophisticated type-level features is to redo parts of the typechecker.

## Trying to use a simpler solution
I've tried multiple attempts at implementing this using the existing typechecker, but I feel like it's ammounting in a waste of time. The coupling between integer-size and the logic in the compiler is strong - and changing it would have cascading consequences into the rest of the compiler (I've not examined how much of a cascade this would be and maybe that's a good idea to do). I feel like I've dug around in this for too long without any really good results...
