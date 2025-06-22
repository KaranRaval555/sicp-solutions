#lang sicp

(define (reverse l)
  (if (null? l) nil
    (append (reverse (cdr l)) (list (car l)))))

(define (reverse li)
  (define (iter old new)
    (if (null? old) new
      (iter (cdr old) (cons (car old) new))))
  (iter li '()))

(reverse (list 1 4 9 16 25))
