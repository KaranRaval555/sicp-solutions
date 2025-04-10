#lang sicp

; (define (cont-frac n d k)
;   (define (helper i)
;     (if (= i k)
;       0
;       (/ (n i) (+ (d i) (helper (+ i 1))))))
;   (helper 1))

(define (cont-frac n d k)
  (define (helper i res)
    (if (zero? i)
      res
      (helper (- i 1) (/ (n i) (+ res (d i))))))
  (helper k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)


