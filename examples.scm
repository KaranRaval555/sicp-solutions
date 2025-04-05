#lang sicp
(#%require racket/trace)

; Searching for divisors
(define (square x) (* x x))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))
; (trace prime?)
; (trace smallest-divisor)
; (trace find-divisor)
; (prime? 11)
; (smallest-divisor 11)
; (find-divisor 11 2)
; (find-divisor 11 3)
; (find-divisor 11 4)
; 11
; #t

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
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
(trace expmod)
(trace fermat-test)
(trace fast-prime?)

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) 
                     start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes lower upper)
  (cond ((even? lower) (search-for-primes (+ lower 1) upper))
        ((> lower upper) (newline))
        (else (timed-prime-test lower)
              (search-for-primes (+ lower 2) upper))))

(define (cube x) (* x x x))
(define (identity x) x)
; (define (sum-integers a b)
;   (if (> a b) 0
;     (+ a (sum-integers (+ a 1) b))))
; (define (sum-cubes a b)
;   (if (> a b) 0
;     (+ (cube a) (sum-cubes (+ x 1) b))))
; (define (pi-sum a b)
;   (if (> a b) 0
;     (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))
(define (sum term next a b ans)
  (define (sum-iter a b ans)
    (if (> a b) ans
      (sum-iter (next a) b (+ ans (term a)))))
  (sum-iter a b 0))
(define (sum-cubes a b)
  (sum cube inc a b))
(sum-cubes 1 10)
(define (sum-integers a b)
  (sum identity inc a b))
(sum-integers 1 10)
(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2)))) (lambda (x) (+ x 4)) a b))
(* 8 (pi-sum 1 1000))
