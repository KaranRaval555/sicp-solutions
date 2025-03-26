#lang simply-scheme
(require racket/trace)

(define (square x) (* x x))

(define average
  (lambda (x y)
    (/ (+ x y) 2)))

(define mean-square
  (lambda (x y)
    (average (square x) (square y))))
(define (abs x) (if (< x 0) (- x) x))

(define (try g x)
  (if (good-enough? g x)
    g
    (try (improve g x) x)))

(define (improve g x)
  (average g (/ x g)))

(define (good-enough? g x)
  (< (abs (- (square g) x)) 0.00001))

(define (sqrt x) 
  (try 1 x))
(trace try)
(trace good-enough?)
(trace improve)
(sqrt 2.0)
(sqrt 3.0)
(sqrt 4.0)

