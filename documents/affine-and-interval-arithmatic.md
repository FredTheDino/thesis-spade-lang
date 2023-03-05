sources: self-validated-numerical-methods-and-applications, course on static analysis Ahmed Rezine

# Affine and Interval Arithmetic
Affine arithmetic and interval arithmetic and two common ways to estimate. They can be applied to estimating the number of piano tuners in Chicago or the cosine of an angle. They also have a place in static analysis of programs, which is the focuses of this thesis. This section describes what these concepts are, references literature if you want to read more and shows their roll in static analysis of programs. These methods are often referred to as over-estimation.

## Interval Arithmetic
Interval arithmetic operates on intervals, as the name implies. A value -- or in the context of a program, a variable -- has a smallest and largest value it can assume. Consider `x = random_real()`, where `random_real` generates a random value in the range $[0, 1]$. We can express this in interval arithmetic as $\bar{x} = [0, 1]$, intervals will be denoted with a bar on top to separate them from the variables. Note especially that the true value of $x$ lies in the interval $\bar{x}$. In this example we know $0 \leq x \leq 1$, also written as $x \in [0, 1]$. These intervals can be added, negated, and so on, to give you an estimate of an arbitrary expression.

For a more throughout guide I recommend (INSERT SOURCE HERE)[self-validated-numerical-methods-and-applications], this section will cover the basics that are needed to understand the concept and understand this thesis. A full description of the field is out of scope.

### Interval. Special values
When doing static program analysis, some extra values are often defined. For example, it's okay to have an interval where one value is infinite. This interval is perfectly valid $[5, \infty]$.

The empty interval is also defined, $[]$. This interval usually denotes expressions or code that cannot be reached or evaluated. It might seem useless at a glance, but is required to do more sophisticated static analysis.

<!-- Should I write this as latex directly instead? -->
### Interval. Definition
An interval is denoted, in this thesis, using square brackets, $[a, b]$ where $a \leq b$.

### Interval. Addition
Two intervals can be added together, we then add the smallest and the largest numbers separately. That is: $[a, b] + [c, d] = [a + c, b + d]$.

### Interval. Scaling
An interval can be scaled by a constant. So $s * [a, b] = [\textrm{min}(s * a, s * b), \textrm{max}(s * a, s * b)]$. This automatically gives us negation and subtraction. Negation is scaling with $-1$ and subtraction is just negation followed by addition.

### Interval. Multiplication
This operation is quite tricky, since negativity matters and forces us to consider multiple possibilities. Though a bit wasteful, it can be expressed simply with `min` and `max`. So $[a, b] * [c, d] = [\textrm{min}(a * c, a * d, b * c, b * d), \textrm{max}(a * c, a * d, b * c, b * d)]$.

### Interval. Meet (intersection)
The set intersection of two intervals. This can be used if we can find two calculations for the same expression, then we know it has to lie in both of these intervals. If we want to reason about an if-statement like `if x > 0`, we know that $x$ must lie in the interval $[0, \infty]$ inside that code-block.

$[a, b] \wedge [c, d] = [\textrm{max}(a, b), \textrm{min}(b, d)]$.$

### Interval. Join (union)
The set union or the combination of two values. This is often useful when merging if-branches if both of them modify a value.
$[a, b] \vee [c, d] = [\textrm{min}(a, c), \textrm{max}(b, d)]$.

<!-- Does this make it a ring? I'm pretty sure it does actually... -->

### Interval. An example and limitations
I find that one of the best ways to understand these things is with an example.
We will be using the expression $2x + z - z$ as an example where $x = [0, 1], z = [1, 3]$.

<!-- TODO: Make this clearer -->
```
2 * [0, 1] + [1, 3] - [1, 3]
// Scaling rule and subtraction is negated addition 
[2 * 0, 2 * 1] + [1, 3] + (-1 * [1, 3])
// Calculate
[0, 2] + [1, 3] + [-3, -1]
// Sum it upp
[-2, 4]
```

This gives us the conclusion that this expression will lie in the range $[-2, 4]$ for the given values of $x$ and $z$. This is true, but the estimate is larger than it necessarily needs to be. An observant reader would notice that subtracting the value $z$ from itself should result in $0$, which is a perfectly valid point. This is a limitation of the interval arithmetic. Interval arithmetic doesn't reason about the expressions that came before it and how they combine, and this limitation would exist if used to do static analysis of programs. But this limitation leads us to affine arithmetic, which lets us reason more about the expressions we evaluate.

<!-- TODO: Error explosion, this topic probably needs to be covered, but maybe cover them for both? -->
