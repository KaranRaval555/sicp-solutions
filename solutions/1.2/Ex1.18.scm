#lang sicp

(define (double n) (* n 2))
(define (halve n) (/ n 2))

;; Iterative process
(define (mul a b)
  (define (mul-iter a b ans)
    (cond
      ((= b 0) ans)
      ((even? b) (mul-iter (double a) (halve b) ans))
      (else (mul-iter a (- b 1) (+ a ans)))))
  (mul-iter a b 0)) 
(mul 19 19)
