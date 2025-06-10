#lang sicp

(define (square x) (* x x))
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer (square (car things))
                    ))))
  (iter items nil))
(square-list '(1 2 3 4 5))

; Unfortunately, defining square-list this way produces the answer list in the reverse order of the one desired. Why?
; Because each squared element is prepended to the front of the answer list.

; Interchanging arguments doesn't work either because Because cons expects a list as its second argument, so putting a number there creates an improper list like '(() 1).

