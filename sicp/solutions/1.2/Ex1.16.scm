#lang sicp

(define (expt b n)
  (define (fast-expt-iter b n a)
    (cond
      ((= n 0) a)
      ((even? n) (fast-expt-iter (sq b) (/ n 2) a))
      (else (fast-expt-iter b (- n 1) (* b a)))))
  (fast-expt-iter b n 1))
