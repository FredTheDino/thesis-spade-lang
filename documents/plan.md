# Plan for Master Thesis

## Preliminary title: Using overestimation to optimize FPGA designs in Spade

## Preliminary problem statement relating to suggested literature
 - Can IA and AA be used to optimize FPGA designs?
 - Can a programming language automatically optimize the memory usage of FPGAs?

## Preliminary description of method and scientific approach
Change the Spade compiler to reason about the ranges of variables instead of number of bytes. We can then observe the footprint of the designs with and without this optimization. If this isn't enough content we can take the analysis even further. Thus we have an experiment that we can run, showing it's applicable to different kinds of "programs". Implementing IA and AA to overestimate additions and such should then be used to correctly calculate the word-length of functions and entities.

## Planned literature supporting the thesis
  - Books and papers on IA and AA
    - Self-Validated Numerical Methods and Applications
  - Static analysis books and literature, potentially digging into bounded model checking (BMC) and the likes
    - Calculus of Computation, maybe more literature here
  - The course on program analysis available on LiU 
    - TDDE34 and the presentations there
  - Previouse literature on Spade
    - Spade: An HDL Inspired by Modern Software Languages and co
  - Books and papers on typecheckers and compilers books and literature
    - Some papers on Henk are interesting
    - Complete and Easy Bidirectional Typechecking for Higher-Rank Polymorphism
    - Types and Programming Languages by Ben Pierce
  - There's a lot of FPGA literature on FPGA optimizaton, here are a few I've seen 
     - Constantinides, George A.
       Word-length Optimization for Differentiable Nonlinear Systems
     - N. Doi and T. Horiyama and M. Nakanishi and S. Kimura
       Minimization of fractional wordlength on fixed-point conversion for high-level synthesis
     - I have like 10 more of these...

## Plan for the execution as well as planned dates for intermediate (half-time) control and presentation
  - Current plan
    1. First block, 4 weeks
      - Research on methods for deducing word lengths
      - Get comfortable with the Spade compiler and Spade-lang
      - Write some background on researched topics
    2. Implementation, 4 weeks:
      - Get a prototype implemented in Spade, potentially extend the scope of the thesis work to make it clearer and better
      - In paralell to this some work can be done on the paper, more background, some introduction but mainly method so I write it while I'm doing it
      - Mid week presentation would be around here somewhere
    3. Collect results and write rest of report, 4 weeks
      - This also serves as padding for potential implementation errors
      - Results and conclusion should be written here
    4. Final presentation and polish 2 weeks
      - Do the presentation
      - Read the entire thesis and make sure it's internally consistent

## Expected preliminary results that can be demonstrated at the half-time check
  - Handle simple expressions like $a + b$
  - Have managed to check/deduce the word lengths in something

## Risk analysis for different aspects of the thesis, for example, data sets for evaluation, shortcomings in the method, reasons for delays, missing/delayed hardware/software
  - Delays might come from the compiler being hard to work due to the current state of the language. But for that I should be able to ask Frans so it should be safe, but it might be impossible.
  - As far as I know, no-one has gone this route of coupling word deduction and a Hindley-Milner typechecker before, which might cause problems
  - No special hardware is required, a simulator might even be overkill to do these changes to the compiler, which should be a great deal faster for me to work with than actual hardware
  - Other things in my life might also interfer, working at a startup can take time and make this process take longer than it should for me

