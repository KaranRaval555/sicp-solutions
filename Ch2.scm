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

(define (sum-odd-squares tree)
  (accumulate + 0 (map square (filter odd? (enumerate-interval tree)))))
(define (even-fibs n)
  (accumulate cons nil (filter even? (map fib (enumerate-interval 0 n)))))
