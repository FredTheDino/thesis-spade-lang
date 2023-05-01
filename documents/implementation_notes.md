# Try 1
Yes, this didn't work. I severed too many connections in the compiler for it to infer things. The idea of propagating the constraints by variable substitution isn't a super bad idea - but it does throw away information and might cause other issues.

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

74c966a (HEAD -> the-simplest-implementation) Try throwing more expressions at it
e2e57ed Get agressive and implement a sat-solver
7800560 Get some hybris and change way too much
d0fd736 (origin/flag-for-aa, flag-for-aa) Turns out it wasn't unused

# Try 2
Problems:
   - I need equation context for the inference to work - I need a third thing
   - Not happy about adding this amount of complexity but I think it's fine
   - I also need IA to be inserted somewhere

3d92c0e (HEAD -> the-second-simplest-thing) Doesn't work either, I need the full equations
d0fd736 (origin/flag-for-aa, flag-for-aa) Turns out it wasn't unused

# Try 3
Added a new kind of constraint - but this won't fly since it doesn't interact with the other constraints. I think I actually have equivalence constraints - and I need equivalence constraints for this to actually work (otherwise I don't get enough information).

Problems:
    - Feels complicated
    - Doesn't interact with current constraints
    - It's directional and hard to write these constraints. With equivalence I get enough constraints to solve the equations correctly.
    - I have to know the size of sub-expressions and have to change the code to reflect that.

83d1da4 (HEAD -> the-third-simplest-with-equations) Try it again
a3cb372 Add size equations
d0fd736 (origin/flag-for-aa, flag-for-aa) Turns out it wasn't unused
