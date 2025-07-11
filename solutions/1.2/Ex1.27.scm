#lang sicp

(define (square x) (* x x))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (carmichael-number? n)
  (define (fast-prime n a)
    (cond ((= a 0) true)
          ((fermat-test n a) (fast-prime n (- a 1)))
          (else false)))

(map carmichael-number? '(561 1105 1729 2465 2821 6601)) ; Carmichael no's fool it,
(map prime? '(561 1105 1729 2465 2821 6601))        ; but none of them are prime
(carmichael-number? 561)

