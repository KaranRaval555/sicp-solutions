#lang sicp

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define make-rect cons)
(define p1-rect car)
(define p2-rect cdr)

(define (width-rect rect)
  (abs (- (x-point (p1-rect rect))
          (x-point (p2-rect rect)))))

(define (height-rect rect)
  (abs (- (y-point (p1-rect rect))
          (y-point (p2-rect rect)))))

(define (perimeter rect)
  (* 2 (+ (width-rect rect) (height-rect rect))))
(define (area rect)
  (* (width-rect rect) (height-rect rect)))

(define rect (make-rect (make-point 1 2) (make-point 6 5)))
(perimeter rect)
(area rect)

