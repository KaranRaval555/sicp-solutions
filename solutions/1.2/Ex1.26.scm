#lang sicp

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
           (* (expmod base (/ exp 2) m)
              (expmod base (/ exp 2) m))
           m))
        (else
          (remainder 
            (* base 
               (expmod base (- exp 1) m))
            m))))
; In the original implementation, Each recursive call reduces exp by half resulting in logarithmic steps
; In above implementation due to duplication of recursive calls, the total number of calls becomes 2^n essentially linear
