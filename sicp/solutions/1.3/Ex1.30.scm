#lang sicp
(define (sum a b next term)
  (define (iter a ans)
    (if (> a b)
        ans
        (iter (next a) (+ ans (term a)))))
  (iter a 0))
