#lang sicp

; Church numerals
(define zero
  (lambda (f)
    (lambda (x) x)))

(define one
  (lambda (f)
    (lambda (x) (f x))))

(define two
  (lambda (f)
    (lambda (x) (f (f x)))))

(define (add1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(add1 zero)
; Using our Substitution model aka beta reduction in lambda calc
; (add1 (lambda (f) (lambda (x) x)))
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f x)))

(add1 one)
; (add-1 (lambda (f) (lambda (x) (f x))))
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
; (lambda (f) (lambda (x) (f (f x))))

(define (add M N)
  (lambda (f)
	(lambda (x)
	  ((M f) ((N f) x)))))
; (add one one)
; (add (lambda (f) (lambda (x) (f x))) (lambda (f) (lambda (x) (f x))))
; (lambda (f)
;   (lambda (x)
; (((lambda (f) (lambda (x) (f x))) f) (((lambda (f) (lambda (x) (f x))) f) x))))
; (lambda (f)
;   (lambda (x)
; ((lambda (x) (f x)) ((lambda (x) (f x)) x))))
; (lambda (f)
;   (lambda (x)
; ((lambda (x) (f x)) (f x))))
; (lambda (f)
;   (lambda (x)
; (f (f x))))


(((add one one) inc) 0)
(((add two one) inc) 0)
(((add two two) inc) 0)
