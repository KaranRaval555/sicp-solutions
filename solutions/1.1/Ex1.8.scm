#lang sicp

(define (sq x) (* x x))
(define (cb x) (* x x x))
(define (average x y) (/ (+ x y) 2))
(define (cube-root x) 
  (define (good-enough? y) (< (abs (- (cb y) x)) 0.000000001))
  (define (improve y) (/ (+ (/ x (sq y)) (* 2 y)) 3))
  (define (cube-iter y x)
    (if (good-enough? y) y
      (cube-iter (improve y) x)))
  (cube-iter 1.0 x))

;; test
(cube-root 27)
; 3.0000000000000977
