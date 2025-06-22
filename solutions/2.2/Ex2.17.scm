#lang sicp

(define (last-pair l)
  (if (null? (cdr (cdr l))) (cdr l)
    (last-pair (cdr l))))

(last-pair (list 23 72 149 34))
