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
(define (average x y) (/ (+ x y) 2))
(define (close-enough? x y) 
  (< (abs (- x y)) 0.001))
(define (search f neg-point pos-point)
  (let ((midpoint 
         (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond 
           ((positive? test-value)
            (search f neg-point midpoint))
           ((negative? test-value)
            (search f midpoint pos-point))
           (else midpoint))))))
(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) 
                (positive? b-value))
           (search f a b))
          ((and (negative? b-value) 
                (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of 
                   opposite sign" a b)))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point 
   (average-damp 
    (lambda (y) (/ x y)))
   1.0))

(define (cont-frac n d k)
  (define (helper i)
    (if (= i k)
      0
      (/ (n i) (+ (d i) (helper (+ i 1))))))
  (helper 1))
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y)) average-damp 1.0))
