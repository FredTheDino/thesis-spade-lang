# Things to research
  - [x] Affine Arithmetic and Interval Arithmetic
    - [x] Summarise Interval Arithmetic
    - [ ] Summarise Affine Arithmetic
  - [ ] AC-Types

# Things to do
  - [ ] Fix something in Spade
    - [x] Compiled and downloaded
    - [ ] Found a bug to fix
    - [ ] Fixed the bug

  - [ ] Write a project plan, kinda started, but not complete
    - Preliminary title
      - Using Affine Arithmetic and Interval Arithmetic to optimize FPGAs in Spade
    - Preliminary problem statement relating to suggested literature
      - Can IA and AA be used to optimize FPGA designs?
      - Can a programming language automatically optimize the memory usage of FPGAs?
    - Preliminary description of method and scientific approach
      - Change Spade to reason about the ranges of variables instead of number of bytes. We can then observe the footprint of the designs with and without this optimization. If this isn't enough content we can take the analysis even further. Thus we have an experiment that we can run, showing it's applicable to different kinds of "programs".
      - One could even take this a step further and move further into the domain of static analysis, and thus check if-branches and conditions to check for other common programming errors and improve the accuracy of analysis.
    - Planned literature supporting the thesis
      - Static analysis books and literature, potentially digging into bounded model checking (BMC) and the likes, and correctness is maybe something that's of interest
      - There's a lot of FPGA literature on FPGA optimizaton, here are a few I've seen 
         - Constantinides, George A.
           Word-length Optimization for Differentiable Nonlinear Systems

         - N. Doi and T. Horiyama and M. Nakanishi and S. Kimura
           Minimization of fractional wordlength on fixed-point conversion for high-level synthesis
    - Plan for the execution as well as planned dates for intermediate (half-time) control and presentation
      - I have trouble with this since I have a lot of things to balance in my life, but my first estimate is. But this estimate is probably in the ballpark.
      - Current plan
        1. First block, 4 weeks
          - Research on methods for deducing word lengths
          - Get comfortable with the Spade compiler and Spade-lang
          - Write some background on researched topics
        2. Implementation, 4 weeks:
          - Get a prototype implemented in Spade, potentially extend the scope of the thesis work to make it clearer and better
        3. Collect results and write rest of report, 4 week
        4. Final presentation and potential flex time 2 weeks
    - Expected preliminary results that can be demonstrated at the half-time check
      - Handle simple expressions like $a + b$
      - Have managed to optimize something 
    - Risk analysis for different aspects of the thesis, for example, data sets for evaluation, shortcomings in the method, reasons for delays, missing/delayed hardware/software
      - Delays might come from the compiler being hard to work due to the current state of the language. But for that I should be able to ask Frans so it should be safe, but it might be impossible.
      - As far as I know, no-one has gone this route of coupling word deduction and a Hindley-Milner typechecker before, which might cause problems
      - No special hardware is required, a simulator might even be overkill to do these changes to the compiler, which should be a great deal faster for me to work with than actual hardware
      - Other things in my life might also interfer, working at a startup can take time and make this process take longer than it should for me

# Problems
  - Consider the case `a = a - 2a`, how should this be handled? If there are mutable variables here, things get messy quickly and most reasoning breaks down.
    - Affine Arithmetic solves this

# Ideas
  - The compiler could potentially try different combinations of addition and multiplication which
  - Optimizing FPGA designs is something that is well researched, which is nice
