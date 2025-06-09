#lang sicp

(define (sgn x)
  (cond ((positive? x) 1)
        ((zero? x) 0)
        ((negative? x) -1)))

(define (make-rat n d)
  (let ((g (gcd n d))
        (s (* (sgn n) (sgn d))))
        (cons (* s (/ (abs n) g)) (/ (abs d) g))))
