#lang sicp

(define (deep-reverse x)
  (define (iter old new)
    (if (or (null? old) (not (pair? old))) new
      (iter (cdr old) (cons (reverse (car old)) new))))
  (iter x '()))
;
(define (deep-reverse x)
  (cond ((null? x) '())
        ((not (pair? x))
         (list x))
        ((not (pair? (car x)))
         (append (deep-reverse (cdr x)) (list (car x))))
        (else
          (append (deep-reverse (cdr x)) 
                  (list (deep-reverse (car x)))))))
(define x
  (list (list 1 2) (list 3 4)))

x
; ((1 2) (3 4))

(reverse x)
; ((3 4) (1 2))

(deep-reverse x)
; ((4 3) (2 1))
