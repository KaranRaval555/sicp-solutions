#lang sicp

(define tolerance 0.00001)
(define (average x y) (/ (+ x y) 2))
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
(display (fixed-point (lambda (x) (/ (log 1000) (log x))) 2)) (newline)
(display "using average damping")
(newline)
(display (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2)) (newline)
; It takes 35 steps to converge without damping, 
; but only 10 steps with the damping method. 
; It is clear that damping makes the convergence faster in this case.
