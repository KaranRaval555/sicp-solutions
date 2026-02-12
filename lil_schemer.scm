#lang sicp
(#%require racket/trace)

(define (atom? x) (not (list? x)))

(define (lat? l)
  (if 
    (null? l) #t
    (and (atom? (car l)) (lat? (cdr l)))))

(define (member? a l) 
  (if
    (null? l) #f
    (or (eq? (car l) a) (member? a (cdr l)))))

(define (rember a l)
  (cond 
    ((null? l) '())
    ((eq? a (car l)) (cdr l))
    (else (cons (car l) (rember a (cdr l))))))

(define (firsts l)
  (if (null? l) l
    (cons (car (car l)) (firsts (cdr l)))))

(define (seconds l)
  (if (null? l) l
    (cons (car (cdr (car l))) (seconds (cdr l)))))

(define (insertL new old l)
  (cond 
    ((null? l) '())
    ((eq? old (car l)) (cons new (cons old (cdr l))))
    (else (cons (car l) (insertL new old (cdr l))))))

(define (insertR new old l)
  (cond 
    ((null? l) '())
    ((eq? old (car l)) (cons old (cons new (cdr l))))
    (else (cons (car l) (insertR new old (cdr l))))))

(define (subst1 new old l)
  (cond 
    ((null? l) '())
    ((eq? old (car l)) (cons new (cdr l)))
    (else (cons (car l) (subst1 new old (cdr l))))))

(define (subst2 new o1 o2 l)
  (cond 
    ((null? l) '())
    ((or (eq? o1 (car l)) (eq? o2 (car l))) (cons new (cdr l)))
    (else (cons (car l) (subst2 new o1 o2 (cdr l))))))

(define (multirember a l)
  (cond 
    ((null? l) '())
    ((eq? a (car l)) (multirember a (cdr l)))
    (else (cons (car l) (multirember a (cdr l))))))

(define (multiinsertL new old l)
  (cond 
    ((null? l) '())
    ((eq? old (car l)) (cons new (cons old (multiinsertL new old (cdr l)))))
    (else (cons (car l) (multiinsertL new old (cdr l))))))

(define (multiinsertR new old l)
  (cond 
    ((null? l) '())
    ((eq? old (car l)) (cons old (cons new (multiinsertR new old (cdr l)))))
    (else (cons (car l) (multiinsertR new old (cdr l))))))

(define (multisubst new old l)
  (cond 
    ((null? l) '())
    ((eq? old (car l)) (cons new (multisubst new old (cdr l))))
    (else (cons (car l) (multisubst new old (cdr l))))))

(define (add x) (+ x 1))
(define (sub x) (- x 1))

(define (plus x y)
  (if
    (zero? y) x
    (plus (add x) (sub y))))

(define (minus x y)
  (if
    (zero? y) x
    (minus (sub x) (sub y))))

(define (addtup tup)
  (if
    (null? tup) 0
    (plus (car tup) (addtup (cdr tup)))))

(define (mul x y)
  (if
    (zero? y) 0
    (plus x (mul x (sub y)))))

(define (tup+ x y)
  (cond 
    ((and (null? x) (null? y)) '())
    ((null? x) y)
    ((null? y) x)
    (else (cons (plus (car x) (car y)) (tup+ (cdr x) (cdr y))))))

(define (> a b)
  (cond
    ((zero? b) #t)
    ((or (zero? a) (= a b)) #f)
    (else (> (sub a) (sub b)))))

(define (< a b)
  (cond
    ((zero? a) #t)
    ((or (zero? b) (= a b)) #f)
    (else (< (sub a) (sub b)))))

(define (= a b)
  (cond
    ((and (zero? a) (zero? b)) #t)
    ((or (zero? a) (zero? b)) #f)
    (else (= (sub a) (sub b)))))

(define (sq x) (mul x x))

(define (one? x) (= x 1))

(define (expt b n)
  (if
    (zero? n) 1
    (mul b (expt b (sub n)))))

(define (quotient x y)
  (if
    (< x y) 0
    (add (quotient (- x y) y))))

(define (length l)
  (if
    (null? l) 0
    (add (length (cdr l)))))

(define (pick n l)
  (if
    (one? n) (car l)
    (pick (sub n) (cdr l))))

(define (rempick n l)
  (if 
    (one? n) (cdr l)
    (cons (car l) (rempick (sub n) (cdr l)))))

(define (no-nums l)
  (cond 
    ((null? l) '())
    ((not (number? (car l))) (cons (car l) (no-nums (cdr l))))
    (else (no-nums (cdr l)))))

(define (all-nums l)
  (cond
    ((null? l) '())
    ((number? (car l)) (cons (car l) (all-nums (cdr l))))
    (else (all-nums (cdr l)))))

(define (eqan? a1 a2)
  (cond
    ((and (number? a1) (number? a2)) (= a1 a2))
    ((or (null? a1) (null? a2)) #f)
    (else (eq? a1 a2))))

(define (occur a lat)
  (cond
    ((null? lat) 0)
    ((eqan? a (car lat)) (add (occur a (cdr lat))))
    (else (occur a (cdr lat)))))

(define (rember* a l)
  (cond
    ((or (atom? l) (null? l)) l)
    ((eqan? a (car l)) (rember* a (cdr l)))
    (else (cons (rember* a (car l)) (rember* a (cdr l))))))

(define (insertL* new old l)
  (cond
    ((or (atom? l) (null? l)) l)
    ((eqan? old (car l)) (cons new (cons old (insertL* new old (cdr l)))))
    (else (cons (insertL* new old (car l)) (insertL* new old (cdr l))))))

(define (insertR* new old l)
  (cond
    ((or (atom? l) (null? l)) l)
    ((eqan? old (car l)) (cons old (cons new (insertR* new old (cdr l)))))
    (else (cons (insertR* new old (car l)) (insertR* new old (cdr l))))))

(define (occur* a l)
  (cond
    ((or (null? l) (atom? l)) 0)
    ((eqan? a (car l)) (add (occur* a (cdr l))))
    (else (plus (occur* a (car l)) (occur* a (cdr l))))))

(define (subst* new old l)
  (cond
    ((or (null? l) (atom? l)) l)
    ((eqan? old (car l)) (cons new (subst* new old (cdr l))))
    (else (cons (subst* new old (car l)) (subst* new old (cdr l))))))

(define (member* a l)
  (cond
    ((or (null? l) (atom? l)) #f)
    ((eqan? (car l) a) #t)
    (else (or (member* a (car l)) (member* a (cdr l))))))

(define (leftmost l)
  (if (atom? (car l)) (car l)
    (leftmost (car l))))

(define (eqlist? l1 l2)
  (cond 
    ((and (null? l1) (null? l2)) #t) 
    ((or (null? l1) (null? l2)) #f)
    (else (and (equal? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2))))))

(define (equal? s1 s2)
  (cond 
    ((and (atom? s1) (atom? s2)) (eqan? s1 s2))
    ((or (atom? s1) (atom? s2)) #f)
    (else (eqlist? s1 s2))))


(define operators '(+ - * /))

(define (numbered? x)
  (cond
    ((or (number? x) (null? x)) #t)
    ((list? (car x)) (numbered? (car x)))
    ((or (number? (car x)) (member? (car x) operators)) (numbered? (cdr x)))
    (else #f)))

(define set?
  (lambda (s)
    (cond
      ((null? s) #t)
      ((member? (car s) (cdr s)) #f)
      (else (set? (cdr s))))))

(define makeset
  (lambda (s)
    (cond
      ((null? s) s)
      ((member? (car s) (cdr s)) (makeset (cdr s)))
      (else (cons (car s) (makeset (cdr s)))))))

(define subset?
  (lambda (set1 set2)
    (cond 
      ((null? set1) #t)
      ((member? (car set1) set2) (subset? (cdr set1) set2))
      (else #f))))

(define (eqset? s1 s2) (and (subset? s1 s2) (subset? s2 s1))) 

(define intersect?
  (lambda (s1 s2)
    (cond
      ((null? s1) #f)
      ((member? (car s1) s2) #t)
      (else (intersect? (cdr s1) s2)))))

(define intersect
  (lambda (s1 s2)
    (cond
      ((null? s1) s1)
      ((member? (car s1) s2) (cons (car s1) (intersect (cdr s1) s2)))
      (else (intersect (cdr s1) s2)))))

(define (combine s1 s2)
    (if (null? s1) s2
        (cons (car s1) (combine (cdr s1) s2))))

(define (union s1 s2) (makeset (combine s1 s2)))

(define intersect-all
  (lambda (l)
    (if (null? (cdr l)) (car l) 
        (intersect (car l) (intersect-all (cdr l))))))

(define (pair? l) (= 2 (length l)))

(define (first l) (car l))
(define (second l) (car (cdr l)))
(define (third l) (car (cdr (cdr l))))
(define (build s1 s2) (cons s1 (cons s2 '())))

(define fun?
  (lambda (rel)
    (set? (firsts rel))))

(define revrel
  (lambda (rel)
    (if (null? rel) rel
        (cons (build (second (car rel)) (first (car rel))) (revrel (cdr rel))))))

(define (fullfun? l) (fun? (seconds l)))

(define eq-c?
  (lambda (a)
    (lambda (x)
      (eq? x a))))

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
        ((null? l) l)
        ((test? (car l) a) (cdr l))
        (else (cons (car l) ((rember-f test?) a (cdr l))))))))

(define insertL-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        ((or (atom? l) (null? l)) l)
        ((test? old (car l)) (cons new (cons old ((insertL-f test?) new old (cdr l)))))
        (else (cons ((insertL-f test?) new old (car l)) ((insertL-f test?) new old (cdr l))))))))

(define insertR-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        ((or (atom? l) (null? l)) l)
        ((test? old (car l)) (cons old (cons new ((insertR-f test?) new old (cdr l)))))
        (else (cons ((insertR-f test?) new old (car l)) ((insertR-f test?) new old (cdr l))))))))

(define seqL
  (lambda (new old l)
    (cons new (cons old l))))

(define seqR
  (lambda (new old l)
    (cons old (cons new l))))

(define insert-g
  (lambda (seq)
    (lambda (new old l)
      (cond
        ((null? l) l)
        ((eq? (car l) old) (seq new old (cdr l)))
        (else (cons (car l) ((insert-g seq) new old (cdr l))))))))

(define new-insertL
  (insert-g (lambda (new old l)
              (cons new (cons old l)))))

(define seqS (lambda (new old l)
               (cons new l)))
(define new-subst (insert-g seqS))
(define seqrem
  (lambda (new old l) l))
(define yyy
  (lambda (a l)
    ((insert-g seqrem) #f a l)))

(define (operator expr) (car expr))

(define 1st-sub-expr
  (lambda (aexpr)
    (car (cdr aexpr))))

(define 2nd-sub-expr
  (lambda (aexpr)
    (car (cdr (cdr aexpr)))))

(define atom-to-function
  (lambda (x)
    (cond
      ((eq? x '+) +)
      ((eq? x '-) -)
      (else /))))

(define value
  (lambda (expr)
    (if (atom? expr) expr
        ((atom-to-function (operator expr) 
                           (value (1st-sub-expr expr))
                           (value (2nd-sub-expr expr)))))))

(define multirember-f
  (lambda (test?)
    (lambda (a l)
      (cond
        ((null? l) l)
        ((test? (car l) a) ((multirember-f test?) a (cdr l)))
        (else (cons (car l) ((multirember-f test?) a (cdr l))))))))

(define eq?-tuna
  (eq-c? 'tuna))

(define multiremberT
  (lambda (test? l)
    (cond
      ((null? l) l)
      ((test? (car l)) (multiremberT test? (cdr l)))
      (else (cons (car l) (multiremberT test? (cdr l)))))))

(define multirember&co
  (lambda (a lat col)
    (cond
      ((null? lat)
       (col (quote ()) (quote ())))
      ((eq? (car lat) a)
       (multirember&co a
                       (cdr lat)
                       (lambda (newlat seen)
                         (col newlat
                              (cons (car lat) seen)))))
      (else
       (multirember&co a
                       (cdr lat)
                       (lambda (newlat seen)
                         (col (cons (car lat) newlat)
                              seen)))))))
(define a-friend
  (lambda (x y)
    (null? y)))

(define new-friend
  (lambda (newlat seen)
    (a-friend newlat (cons 'tuna seen))))

(define multiinsertLR
  (lambda (new oldL oldR l)
    (cond
      ((null? l) l)
      ((eq? oldL (car l)) (cons new (cons oldL (multiinsertLR new oldL oldR (cdr l)))))
      ((eq? oldR (car l)) (cons oldR (cons new (cons (multiinsertLR new oldL oldR (cdr l))))))
      (else (cons (car l) (multiinsertLR new oldL oldR (cdr l)))))))

(define multiinsertLR&co 
  (lambda (new oldL oldR l col)
    (cond
      ((null? l) (col '() 0 0))
      ((eq? oldL (car l)) (multiinsertLR&co new oldL oldR (cdr l)
                                            (lambda (newlat L R)
                                              (col (cons new (cons oldL newlat)) (add L) R)
                                              ))) 
      ((eq? oldR (car l)) (multiinsertLR&co new oldL oldR (cdr l)
                                            (lambda (newlat L R)
                                              (col (cons oldR (cons new newlat)) L (add R))
                                              ))) 
      (else (multiinsertLR&co new oldL oldR (cdr l) (lambda (newlat L R)
                                                      (col (cons (car l) newlat) L R)
                                                      ))))))

(define evens-only*
  (lambda (l)
    (cond
      ((null? l) l)
      ((list? (car l)) (cons (evens-only* (car l)) (evens-only* (cdr l))))
      ((even? (car l)) (cons (car l) (evens-only* (cdr l))))
      (else (evens-only* (cdr l))))))

#| (define evens-only*&co
     (lambda (l col)
       (cond
         ((null? l) l)
         ((list? (car l)) (cons (evens-only* (car l)) (evens-only* (cdr l))))
         ((even? (car l)) (cons (car l) (evens-only* (cdr l) (lambda (new p s)
                                                               (col (cons (car l) new)
                                                                    (* p (car l)) s)))))
         (else (evens-only* (cdr l) (lambda (dnew dp ds)
                                   (col (cons new dnew) (* p dp) (+ s ds)))))))) |# 
(define keep-looking
  (lambda (a ele lat)
      (if (number? ele) (keep-looking a (pick ele lat) lat)
         (eq? a ele))))
(define looking
  (lambda ( a lat)
    (keep-looking a (pick 1 lat) lat)))

(define shift
  (lambda (x)
    (build (first (first x)) (build (second (first x)) (second x)))))

(define align
  (lambda (pora)
    (cond
      ((atom? pora) pora)
      ((pair? (first pora))
        (align (shift pora)))
      (else (build (first pora)
                     (align (second pora)))))))
(align '(((a) (b)) c))
