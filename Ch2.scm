#lang sicp

(define (square x) (* x x))

(define (make-rat n d)
  (let ((g (gcd n d)))
        (cons (/ (abs n) g) (/ (abs d) g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
               (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


; (define (cons x y)
;   (define (dispatch m)
;     (cond ((= m 0) x)
;           ((= m 1) y)
;           (else 
;            (error "Argument not 0 or 1:
;                    CONS" m))))
;   dispatch)
;
; (define (car z) (z 0))
; (define (cdr z) (z 1))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))
(define x (cons (list 1 2) (list 3 4)))

(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares
                  (car tree))
                 (sum-odd-squares
                  (cdr tree))))))

; (define (even-fibs n)
;   (define (next k)
;     (if (> k n)
;         nil
;         (let ((f (fib k)))
;           (if (even? f)
;               (cons f (next (+ k 1)))
;               (next (+ k 1))))))
;   (next 0))
; Enumerate -> Filter -> Map -> Accumulate

(define (filter predicate sequence)
  (cond
    ((null? sequence) nil)
    ((predicate (car sequence))
     (cons (car sequence) (filter predicate (cdr sequence))))
    (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence) initial
    (op (car sequence) (accumulate op initial (cdr sequence)))))
(accumulate + 0 (list 1 2 3 4 5))
(accumulate * 1 (list 1 2 3 4 5))
(accumulate cons nil (list 1 2 3 4 5))

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))
(enumerate-interval 2 7)

(define (enumerate-tree tree)
  (cond
    ((null? tree) nil)
    ((not (pair? tree))
     (list tree))
    (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))))
(enumerate-tree (list 1 (list 2 (list 3 4)) 5))

(define (fib n)
  (if (< n 2) n 
    (+ (fib (- n 1)) (fib (- n 2)))))

; (define (sum-odd-squares tree)
;   (accumulate + 0 (map square (filter odd? (enumerate-tree tree)))))
;
; (define (even-fibs n)
;   (accumulate cons nil (filter even? (map fib (enumerate-interval 0 n)))))

(define (list-fib-squares n)
  (accumulate cons nil (map square (map fib (enumerate-interval 0 n)))))
(list-fib-squares 10)

(define (product-of-squares-of-odd-elements sequence)
  (accumulate * 1 (map square (filter odd? sequence))))
(product-of-squares-of-odd-elements 
 (list 1 2 3 4 5))


(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

; (define (prime-sum? pair)
;   (prime? (+ (car pair) (cadr pair))))

; (define (make-pair-sum pair)
;   (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
;
; (define (prime-sum-pairs n)
;   (map make-pair-sum
;        (filter prime-sum?
;                (flatmap (lambda (i)
;                           (map (lambda (j) (list i j))
;                                (enumerate-interval 1 (- i 1))))
;                         (enumerate-interval 1 n)))))
;
; (prime-sum-pairs 5)
;
; (define (permutations s)
;   (if (null? s)
;       (list '())
;       (flatmap (lambda (x)
;                  (map (lambda (p) (cons x p))
;                       (permutations (remove x s))))
;                s)))
;
; (define (remove item sequence)
;   (filter (lambda (x) (not (equal? x item))) sequence))
;
; (permutations '(a b c))

(define (memq item x)
  (cond
    ((null? x) false)
    ((eq? (car x) item) x)
    (else (memq item (cdr x)))))
(memq 'apple '(x (apple sauce) y apple pear))

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
        (else (error "unknown expression
                      type: DERIV" exp))))
(define (variable? x) (symbol? x))
(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) 
             (=number? m2 0)) 
         0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2))
         (* m1 m2))
        (else (list '* m1 m2))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)


(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left)
                (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch 
                (car bits)
                current-branch)))
          (if (leaf? next-branch)
              (cons
               (symbol-leaf next-branch)
               (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits)
                        next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit: 
               CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) 
         (cons x set))
        (else 
         (cons (car set)
               (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set 
         (make-leaf (car pair)    ; symbol
                    (cadr pair))  ; frequency
         (make-leaf-set (cdr pairs))))))

(define (encode message tree)
  (if (null? message)
      '()
      (append 
       (encode-symbol (car message) 
                      tree)
       (encode (cdr message) tree))))


