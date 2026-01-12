#lang sicp

(car (cdaddr '(1 3 (5 7) 9))) ; 7
(caar '((7)))  ; 7
(cadadr (cadadr (cadadr '(1 (2 (3 (4 (5 (6 7))))))))) ; 7
