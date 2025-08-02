#lang sicp

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))
; Explain what mystery does in general.
; In general, mystery reverses the list x. It does this by walking through the list,
; setting the cdr of each pair to point to the previous pair instead of the next. For the very first pair, it sets the cdr to null.

; (define v (list 'a 'b 'c 'd))
; v->[*|*]->[*|*]->[*|*]->[*|X]
;     |      |      |      |
;     V      V      V      V
;     a      b      c      d
;
; (define w (mystery v))
; v => '(a)
; w => '(d c b a)
; v->[*|X]<-[*|*]<-[*|*]<-[*|*]<-w
;     |      |      |      |
;     V      V      V      V
;     a      b      c      d
; These box-and-pointer diagrams make it obvious that mystery simply changes the directions of all the arrows.
