#lang sicp
(define (sq x) (* x x))
(define (cb x) (* x x x))
(define (average x y) (/ (+ x y) 2))
(define (improve y x) (/ (+ (/ x (sq y)) (* 2 y)) 3))
(define (good-enough? y x) (< (abs (- (cb y) x)) 0.000000001))
(define (cube-iter y x)
  (if (good-enough? y x) y
      (cube-iter (improve y x) x)))
(define (cube-root x) (cube-iter 1.0 x))

;; test
(cube-root 9)
; 2.080083823051904