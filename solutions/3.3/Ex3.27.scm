#lang sicp

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

; The memoized version of the same procedure is

(define memo-fib
  (memoize
   (lambda (n)
     (cond ((= n 0) 0)
           ((= n 1) 1)
           (else
            (+ (memo-fib (- n 1))
               (memo-fib (- n 2))))))))

where the memoizer is defined as

(define (memoize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previously-computed-result
             (lookup x table)))
        (or previously-computed-result
            (let ((result (f x)))
              (insert! x result table)
              result))))))


; The memoize method works by maintaining a table with all previously computed results. If a result exists for value x, it is returned. Otherwise, the result of (f x) is added to the table and then returned.
;
; As to the time requirement, we are going to assume that lookup and insert! are going to operate in constant time. In that case, we have half the number of recursive calls per iteration of the fib function, which will bring our complexity down to
;
; .
;
; If we simply define memo-fib as (memoize fib), it will still work (i.e. output a correct result), but it will not actually be memoized, since the recursive call actually goes to fib and not to memo-fib.
; The memoized procedure memo-fib computes the nth Fibonacci number in a number of steps proportional to n because it takes the sum of n numbers. When we evaluate (memo-fib n), a tree-recursive process is generated and it descends until it reaches 0 and 1, the base cases of the recursive Fibonacci implementation. The results for these inputs are placed in the table, and then (memo-fib 2) requires only one step, the addition of 0 and 1, because the values are taken from the table. In general, we descend to the bottom of the tree once and then ascend it, never again going down and reaching duplicate leaves. This is twice n steps, so it grows as O(n).
;
; If we had defined memo-fib as (memoize fib), it would not work because recursive calls would use fib, not memo-fib, and so we would still have an exponential number of steps. However, this aspect of the memoization would still work: if you evaluated (memo-fib 42) twice, the second time would take only the step of looking up a value in the table.
