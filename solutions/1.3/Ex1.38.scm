#lang sicp

(define (cont-frac n d k)
  (define (helper i res)
    (if (zero? i)
      res
      (helper (- i 1) (/ (n i) (+ res (d i))))))
  (helper k 0))

; 2, 5, 8, 11, 14, 17

(define (series n)
  (if (= 0 (remainder (+ n 1) 3)) (* 2 (/ (+ n 1) 3)) 1))

(define e (+ 2 (cont-frac (lambda (i) 1.0) series 10)))
; Euler's continued fraction approximates e - 2 so we add 2 to get the value of e
e

