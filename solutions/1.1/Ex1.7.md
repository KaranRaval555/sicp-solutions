### Large numbers

- Because each number is encoded on a finite number of bits, the number of floating-point numbers that can be represented in a computer is finite.
- Most of the time, a floating-point number will be the approximation of a real number. During computation, the results will be rounded to the nearest floating-point number.
- As the number of digits of the number represented increases, the size of the “gap” between two consecutive numbers will increase.
- Intuitively, the more decimal is used in the integer part ,the less digit will be available for the fractional part.

```
guess       = 0 10000010100 10101100111010010100111010100001011011000110100111**10** (3513641.8288200637)
(\ x guess) = 0 10000010100 10101100111010010100111010100001011011000110100111**01** (3513641.8288200633)
```

What is interesting is that these two numbers are not only very close to each other, but their floating-point representation in binary is almost the same. Only the last two digits are different: these two numbers are actually following each other! It means that there is no floating-point numbers between these two numbers, we have “run out of precision”.

Since improve is computing the average of guess and (/ x guess), the computer will add the two numbers and divide by two, but since there is no way to represent a number of floating point between these two numbers, the result will be rounded to the closest floating-point number, which is guess, thus explaining why (improve guess x) can’t produce a better result.

---

### Small numbers

The number of digits of precision is hardcoded to 0.001. It means that the program will be ok with inaccurate answer when trying to compute a square root of numbers around or smaller than the precision of 0.001. It is fine if you measure distance between cities, but won’t make any sense if you are measuring the size of atoms 0.001 will be too big
