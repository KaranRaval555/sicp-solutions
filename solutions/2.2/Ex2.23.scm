#lang sicp

(define (for-each proc terms)
  (cond
    ((null? terms) (newline) "done")
    (else (proc (car terms)) (for-each proc (cdr terms)))))
(for-each (lambda (x) (newline) (display x)) (list 57 321 88))


