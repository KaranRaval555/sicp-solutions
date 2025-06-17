#lang sicp

(define (reverse ls)
  (if (null? ls) 
	'()
	(append (reverse (cdr ls)) (list (car ls)))))

(define (reverse li)
  (define (iter old new)
    (if (null? old) new
      (iter (cdr old) (cons (car old) new))))
  (iter li '()))
(reverse (list 1 4 9 16 25))

