#lang sicp

(define (union-set a b)
  (cond
    ((null? a) b)
    ((null? b) a)
    ((= (car a) (car b))
       (cons (car a) (union-set (cdr a) (cdr b))))
      ((< (car a) (car b))
        (cons (car a) (union-set (cdr a) b)))
      ((> (car a) (car b))
        (cons (car b) (union-set a (cdr b))))))
(union-set '() '(1 2 3))
(union-set '(1 2 3) '())
(union-set '(1 2) '(2 3))
