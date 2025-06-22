#lang sicp

(define (for-each proc terms)
  (cond
    ((null? terms) "done")
    (else (proc (car terms)) (for-each proc (cdr terms)))))
(for-each (lambda (x) (display x) (newline)) (list 57 321 88))


