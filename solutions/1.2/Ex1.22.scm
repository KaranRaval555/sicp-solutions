#lang racket
(#%require racket/trace)

(define (square x) (* x x))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (current-inexact-milliseconds)
                     start-time)) #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes lower how-many)
  (cond ((even? lower) (search-for-primes (+ lower 1) how-many))
        ((= how-many 0) (newline))
        ((timed-prime-test lower)
         (search-for-primes (+ lower 2) (- how-many 1)))
        (else (search-for-primes (+ lower 2) how-many))))

(search-for-primes 1000 3) ; 1009, 1013, 1019
(search-for-primes 10000 3) ; 10007, 10009, 10037
(search-for-primes 100000 3) ; 100003, 100019, 100043
(search-for-primes 1000000 3) ; 1000003, 1000033, 1000037
(search-for-primes 1000000000 3) ; 1000000007, 1000000009, 1000000021
(search-for-primes 10000000000 3) ; 10000000019, 10000000033, 10000000061
(search-for-primes 100000000000 3) ; 100000000003, 100000000019, 100000000057
(search-for-primes 1000000000000 3); 1000000000039, 1000000000061, 1000000000063
