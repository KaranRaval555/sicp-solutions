#lang sicp

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))
(sine 12.15)
;while evaluating (sine 12.15) the angle is divided by 3, which means there are around log3a such divisions.
;This also defines the order of growth in space and number of steps of our procedure, i.e., both of them are O(log a)
