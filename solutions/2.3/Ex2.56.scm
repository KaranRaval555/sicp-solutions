#lang sicp

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product
           (deriv (multiplier exp) var)
           (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
           (exponent exp)
             (make-product
             (make-exponenetiation (base exp)
                                   (- (exponent exp) 1))
           (deriv (base exp) var))))
        (else (error "unknown expression 
                      type: DERIV" exp))))
(define (variable? x) (symbol? x))
(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))
(define (make-exponenetiation b exp)
  (cond
    ((=number? b 1) 1)
    ((=number? exp 1) b)
    ((=number? exp 0) 1)
    (else (list '** b exp))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(define (base x) (cadr x))
(define (exponent x) (caddr x))

(deriv '(* 3 (** x 5)) 'x)
