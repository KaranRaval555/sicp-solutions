#lang sicp

(define (count-pairs x)
  (let ((seen '()))
    (define (helper x)
      (if (or (not (pair? x)) (memq x seen))
        0
        (begin
          (set! seen (cons x seen))
          (+ (helper (car x))
             (helper (cdr x))
             1))))
    (helper x)))
