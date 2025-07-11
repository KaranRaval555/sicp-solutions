#lang sicp

(define (cycle? x)
  (cond ((not (pair? x)) #f)
        ((eq? 'MARK (car x)) #t)
        (else (begin (set-car! x 'MARK)
                     (cycle? (cdr x))))))
(cycle? (list 1 2 3))
(cycle? (make-cycle (list 1 2 3)))
