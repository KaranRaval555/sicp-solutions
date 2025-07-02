#lang sicp

(define (sqrt x) (* x x))
(define (make-monitored proc)
  (let
    ((count 0))
    (lambda (arg)
      (cond
        ((eq? arg 'how-many-calls?) count)
        (else (begin (set! count (+ count 1)) count) (proc arg))))))
(define s (make-monitored sqrt))

(s 100)
(s 'how-many-calls?)
(s 100)
(s 'how-many-calls?)
(s 100)
(s 'how-many-calls?)
