(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))

(define (set-to-wow! x) (set-car! (car x) 'wow) x)

z1 => '((a b) a b)
(set-to-wow! z1) => '((wow b) wow b)
z2 => '((a b) a b)
(set-to-wow! z2) => '((wow b) a b)

(eq? (car z1) (cdr z1)) => #t
(eq? (car z2) (cdr z2)) => #f

In z1, the car and cdr both point to x:

; z1->[*|*]
;      | |
;      V V
;  x->[*|*]->[*|X]
;      |      |
;      V      V
;      a      b

After set-to-wow!, the a becomes wow for both car and cdr:

; z1->[*|*]
;      | |
;      V V
;  x->[*|*]->[*|X]
;      |      |
;      V      V
;     wow     b

In z2, the car and cdr point to different cons cells:

; z2->[*|*]->[*|*]->[*|X]
;      |      |      |
;      |      +-> a  +-> b
;      V
;    [*|*]->[*|X]
;     |      |
;     +-> a  +-> b

After set-to-wow!, the a becomes wow only for the car:

; z2->[*|*]->[*|*]->[*|X]
;      |      |      |
;      |      +-> a  +-> b
;      V
;    [*|*]--->[*|X]
;     |        |
;     +-> wow  +-> b
