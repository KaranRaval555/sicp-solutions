(define x 10)

(let ((s (make-serializer)))
  (parallel-execute
   (lambda () (set! x ((s (lambda () (* x x))))))
   (s (lambda () (set! x (+ x 1))))))

Three of the five values are still possible:

101  ; squared, then incremented
121  ; incremented, then squared
; cant figure out rest
