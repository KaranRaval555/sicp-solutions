#lang sicp

(define (double f)
  (lambda (x)
    (f (f x))))

(((double (double double)) inc) 5)

;  you can think of double as apply-2-times
; (apply-2-times apply-2-times) -> apply-4-times
; (apply-2-times apply-4-times) -> apply-16-times

; its not 100% accurate to how function evolves,
; but its is pretty close to what is happening here.

; (double double) = (lambda (x) (double (double x)))
; (double (double double)) = (lambda (x) ((double double) ((double double) x)))
; (lambda (x) (double (double (double (double x)))))
; ((lambda (x) (double (double (double (double x))))) inc) 5)
; ((double (double (double (double inc)))) 5)
; ((double (double (double (inc (inc 5))))))
; ((double (double (inc (inc (inc (inc 5)))))))
; ((double (inc (inc (inc (inc (inc (inc (inc (inc 5))))))))))
; (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc 5))))))))))))))))
