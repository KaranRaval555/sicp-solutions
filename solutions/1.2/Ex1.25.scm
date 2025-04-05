#lang sicp

(define (square x) (* x x))
(define (fast-expt base n) 
  (define (expt-iter base n result)
    (cond 
      ((= n 0) result)
      ((even? n) (expt-iter (square base) (/ n 2) result))
      (else (expt-iter base (- n 1) (* result base)))))
  (expt-iter base n 1))
(define (expmod base exp m)
  (remainder (expt base exp) m))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
(fast-prime? 99 2)

; Alyssa's simplified expmod function is mathematically valid, 
; but its not as efficient as original implementation as it computes the full exponentiation before
; applying the modulus operation which requires handling extremely large intermediate numbers
; The original expmod function's design, which performs the modulus operation at each step,
; effectively manages intermediate result in manageable sizes and ensures more efficient computations.
