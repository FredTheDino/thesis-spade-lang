# Notes About the Papers I've Read

## `Implementation of affine arithmetic in Haskell`
`Implementation of affine arithmetic in Haskell`, by Joosep Jääger
 - source: https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjOv7LPt7j9AhWlZ_EDHRKGCiAQFnoECAoQAQ&url=https%3A%2F%2Fcomserv.cs.ut.ee%2Fhome%2Ffiles%2Fthesis_joosep.pdf%3Fstudy%3DATILoputoo%26reference%3D0835C34CD6F25CD871BABE56FFA1AF251209922F&usg=AOvVaw1MDLa8rO-P993ECNXBjaAx
 - Not the best source, but good for finding more sources
 - Pretty dense in terminology
 - Chebyshev approximations, good research topic

## `Self-Validated Numerical methods and Applications`
 - Good regorous definitions, better than `Implementation of affine arithmetic in Haskell`
 - IA can give different results depending on the order and how you decide to group your expressions.
 - Addition and multiplication is easy, IA could solve that, but what about more tricky operations like sqrt or division? There's a software verification method for this that is used in some programming languages, like Daphny.
 - AA has the benefit of solving `a - a` exactly since it keeps tracks of the dependencies, IA should however be easier to implement.
 - Really good reference

## To Read
 - Books and papers on IA and AA
   - Self-Validated Numerical Methods and Applications
   - Siegfried M Rump and Masahide Kashiwagi. Implementation and improvements of affine arithmetic. Nonlinear Theory and Its Applications, IEICE, 6(3):341–359, 2015.
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



### From Frans - To Read
 - Philippe Coussy and Ghizlane Lhairech-Lebreton and Dominique Heller
   Multiple Word-Length High-Level Synthesis
   http://dx.doi.org/10.1155/2008/916867
    - DEAD

 - Constantinides, George A.
   Word-length Optimization for Differentiable Nonlinear Systems
   http://dx.doi.org/10.1145/1124713.1124716
    - Abstract: Does the same thing as me, but not in a programming language

 - N. Doi and T. Horiyama and M. Nakanishi and S. Kimura
   Minimization of fractional wordlength on fixed-point conversion for high-level synthesis
   http://dx.doi.org/10.1109/aspdac.2004.1337544
    - Abstract: Talks about fractional wordlengths which i don't know what it is

 - Kyungtae Han and Alex G. Olson and Brian L. Evans
   Automatic Floating-Point to Fixed-Point Transformations
   http://dx.doi.org/10.1109/ACSSC.2006.356588

 - Dong-U Lee and Altaf Abdul Gaffar and Oskar Mencer and Wayne Luk
   {MiniBit}: Bit-Width Optimization via Affine Arithmetic
   http://dx.doi.org/10.1145/1065579.1065799

 - Jorge Stolfi and Luiz Henrique De Figueiredo
   Self-Validated Numerical Methods and Applications
   -

 - Jonathan A. Clarke and George A. Constantinides and Peter Y. K. Cheung
   Word-length selection for power minimization via nonlinear optimization
   http://dx.doi.org/10.1145/1529255.1529261

 - Yu Pu and Yajun Ha
   An automated, efficient and static bit-width optimization methodology towards maximum bit-width-to-error tradeoff with affine arithmetic model
   http://dx.doi.org/10.1145/1118299.1118500
   
 - George Constantinides and Adam Kinsman and Nicola Nicolici
   Numerical Data Representations for {FPGA}-Based Scientific Computing
   http://dx.doi.org/10.1109/mdt.2011.48

 - Eva Darulova and Einar Horn and Saksham Sharma
   Sound Mixed-Precision Optimization with Rewriting
   http://dx.doi.org/10.1109/iccps.2018.00028

 - Lao, Alex
   Methodologies for {FPGA} Implementation of Finite Control Set Model Predictive Control for Electric Motor Drives
   https://macsphere.mcmaster.ca/handle/11375/25003

 - Hassan Eldib and Chao Wang
   An {SMT} based method for optimizing arithmetic computations in embedded software code
   http://dx.doi.org/10.1109/fmcad.2013.6679401

 - Deheng Ye and Nachiket Kapre
   {MixFX}-{SCORE}: Heterogeneous Fixed-Point Compilation of Dataflow Computations
   http://dx.doi.org/10.1109/fccm.2014.64

