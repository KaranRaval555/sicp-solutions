### Recursive

```scheme
(define (factorial n)
  (if (= n 1) 1 (* n (factorial (- n 1)))))
```

- Six environments are created in the recursive version:

```scheme
(factorial 6)                                  ; E1 -> [n: 6]
=> (* 6 (factorial 5))                         ; E2 -> [n: 5]
=> (* 6 (* 5 (factorial 4)))                   ; E3 -> [n: 4]
=> (* 6 (* 5 (* 4 (factorial 3))))             ; E4 -> [n: 3]
=> (* 6 (* 5 (* 4 (* 3 (factorial 2)))))       ; E5 -> [n: 2]
=> (* 6 (* 5 (* 4 (* 3 (* 2 (factorial 1)))))) ; E6 -> [n: 1]
=> 720
```

### Iterative

```scheme
(define (factorial n) (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))
```

- Eight environments are created in the iterative version:

```scheme
(factorial 6)          ; E1 -> [n: 6]
=> (fact-iter 1 1 6)   ; E2 -> [p: 1,   c: 1, m: 6]
=> (fact-iter 1 2 6)   ; E3 -> [p: 1,   c: 2, m: 6]
=> (fact-iter 2 3 6)   ; E4 -> [p: 2,   c: 3, m: 6]
=> (fact-iter 6 4 6)   ; E5 -> [p: 6,   c: 4, m: 6]
=> (fact-iter 24 5 6)  ; E6 -> [p: 24,  c: 5, m: 6]
=> (fact-iter 120 6 6) ; E7 -> [p: 120, c: 6, m: 6]
=> (fact-iter 720 7 6) ; E8 -> [p: 720, c: 7, m: 6]
=> 720
```
