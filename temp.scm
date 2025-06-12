#lang sicp
(#%require racket/trace)

(define (atom? l) (not (list? l)))
(define operators '(+ - * /))

(define member?
  (lambda (a l)
    (if (null? l) #f 
        (or (eq? (car l) a) (member? a (cdr l))))))

(define makeset
  (lambda (s)
    (cond
      ((null? s) s)
      ((member? (car s) (cdr s)) (makeset (cdr s)))
      (else (cons (car s) (makeset (cdr s)))))))
(define (combine s1 s2)
    (if (null? s1) s2
        (cons (car s1) (combine (cdr s1) s2))))
(define (union s1 s2) (makeset (combine s1 s2)))

(union '(stewed tomatoes and macaroni casserole) '(macaroni and cheese))


