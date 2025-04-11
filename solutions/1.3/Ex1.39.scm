#lang sicp

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= 0 i)
        result
        (iter (dec i) (/ (n i) (+ result (d i))))))
  (iter (dec k) (/ (n k) (d k))))


(define (tan-cf x k)
  (cont-frac-iter
   (lambda (i) (if (= i 1) x (- (* x x))))
   (lambda (i) (- (* 2.0 i) 1)) ; odd numbers
   k))
(tan-cf 1.0 2)
