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

(define (fermat-all? n)
  (define (iter a)
    (or (>= a n)
        (and (= (expmod a n n) a)
             (iter (+ a 1)))))
  (iter 1))

(fermat-all? 561) => #t
(fermat-all? 1105) => #t
(fermat-all? 1729) => #t
(fermat-all? 2465) => #t
(fermat-all? 2821) => #t
(fermat-all? 6601) => #t
