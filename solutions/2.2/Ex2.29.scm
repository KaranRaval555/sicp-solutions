#lang sicp

; A binary mobile consists of two branches, a left branch and a right branch. Each branch is a rod of a certain length, from which hangs either a weight or another binary mobile. We can represent a binary mobile using compound data by constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with a structure, which may be either a number (representing a simple weight) or another mobile:

(define (make-branch length structure)
  (list length structure))

; mobile =
; (list
;   (list 3 4)   ; left-branch
;   (list 2 5))  ; right-branch

(define left-branch car)
(define right-branch cadr)
(define branch-length car)
(define branch-structure cadr)

(define (total-weight mobile)
  (if (not (pair? mobile)) mobile
    (+ (total-weight (branch-structure (left-branch mobile))) (total-weight (branch-structure (right-branch mobile))))))

(define m
  (make-mobile
    (make-branch 3
      (make-mobile
        (make-branch 1 2)
        (make-branch 1 2)))
    (make-branch 2 4)))

(total-weight m)

; MOBILE
; ├── Left Branch (length 3)
; │   └── Mobile (submobile)
; │       ├── Left Branch (length 1, weight 2)
; │       └── Right Branch (length 1, weight 2)
; └── Right Branch (length 2, weight 4)

(define (torque b)
  (* (branch-length b) (total-weight (branch-structure b))))
(define (torques-equal? b1 b2)
  (= (torque b1) (torque b2)))

; torque = length × weight
; left-torque = branch-length × total-weight of branch-structure
; right-torque = same thing

(define (balanced? m)
  (if (or (null? m) (not (pair? m)))
      #t
      (and (torques-equal? (left-branch m) (right-branch m))
            (balanced? (branch-structure (left-branch m)))
            (balanced? (branch-structure (right-branch m))))))

(define mob1                      ; #t
  (make-mobile (make-branch 3 6)  ; 6 * 3 = 18
	       (make-branch 2 9)))    ; 2 * 9 = 18

(define mob2                      ; #f
  (make-mobile (make-branch 6 4)  ; 6 * 4 = 24
	       (make-branch 5 mob1))) ; 5 * 15 = 75

(define mob3                        ; #t
  (make-mobile (make-branch 15 3)   ; 15 * 3 = 45
	       (make-branch 3 mob1)))   ; 15 * 3 = 45

(branch-structure (right-branch mob1))
(branch-structure (right-branch mob2))

(balanced? mob1)
(balanced? mob2)
(balanced? mob3)


; If make-mobile and make-branch use cons instead of list, all we need to do is change the right-branch and branch-structure selectors because left-branch and branch-length already uses car:
; hell yeah! now i can see how DATA ABSTRACTION makes our system flexible to changes

; (define make-mobile cons)
; (define make-branch cons)
;
; (define right-branch cdr)
; (define branch-structure cdr)
