#lang sicp

(define sum 0)

(define (accum x) (set! sum (+ x sum)) sum)
(define seq (stream-map accum (stream-enumerate-interval 1 20)))
; sum -> 1

(define y (stream-filter even? seq))
; sum -> 6

(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq))
; sum -> 10

(stream-ref y 7) ; 136
; sum -> 136

(display-stream z) ; ["10" "15" "45" "55" "105" "120" "190" "210"]

; Yes, responses will change if memoization is removed because we re-evaluate stream-cdr every time and which causes the sum to change thus running it again, and it would be different each time because sum keeps increasing. Instead of 1, 6, 10, 120, it would be 1, 6, 15, 162. Displaying z would only show 15. The rest of seq gets generated using a much higher sum, none of which are divisible by 5.
