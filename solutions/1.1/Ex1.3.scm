#lang sicp

(define (sq x) (* x x))

(define (two-largest-sum-of-sq a b c)
  (cond
    ((and (>= a c) (>= b c)) (+ (sq a) (sq b)))
    ((and (>= b a) (>= c a)) (+ (sq b) (sq c)))
    (else (+ (sq a) (sq c)))))

;; test:
(two-largest-sum-of-sq 2 3 4)
; 25

(two-largest-sum-of-sq 4 3 8)
; 80

(two-largest-sum-of-sq 7 11 3)
; 170
