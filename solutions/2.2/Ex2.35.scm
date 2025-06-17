#lang sicp

(define (count-leaves t)
  (accumulate + 0 (map (lambda (subtree)
                              (if (not (pair? subtree)) 
                                1
                               (count-leaves subtree))) t)))
(count-leaves '(1 2 (3 (4) 5) (6 7))) 
