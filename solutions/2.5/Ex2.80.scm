#lang sicp

(define (zero-pkg)
  (put '=zero? '(scheme-number) zero?)
  (put '=zero? '(rational)
       (lambda (x) (zero? (numer x))))
  (put '=zero? '(complex)
       (lambda (x) (and (zero? (real-part x))
                        (zero? (imag-part x))))))

(define (=zero? n) (apply-generic '=zero? n))
