#lang sicp

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(define (sq x) (* x x))
(define (average x y) (/ (+ x y) 2))
(define (good-enough? guess x) (< (abs (- (sq guess) x)) 0.001))
(define (improve guess x) (average guess (/ x guess)))
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x) guess
          (sqrt-iter (improve guess x) x)))
(define (sqrt x) (sqrt-iter 1.0 x))
(sqrt 9)

; When Alyssa attempts to use new-if to compute square roots the procedure causes infinite recursion and eventually runs out of memory due to stack overflow
; since new-if isn't a special form it'll evaluate else-clause everytime even if the predicate is true  
