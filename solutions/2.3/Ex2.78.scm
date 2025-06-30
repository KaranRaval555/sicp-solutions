#lang sicp

(define (attach-tag type-tag contents)
  (if (number? contents)
    contents
    (cons type-tag contents)))
(define (type-tag datum)
  (cond
    ((number? datum) 'number)
    ((pair? datum) (car datum))
    (else (erorr "Wrong datum -- TYPE-TAG" datum))))
(define (contents datum)
  (cond
    ((number? datum) datum)
    ((pair? datum) (cdr datum))
    (else (error "Wrong datum -- CONTENTS" datum))))
