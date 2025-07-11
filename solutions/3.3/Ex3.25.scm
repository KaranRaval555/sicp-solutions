#lang sicp

(define (make-table)
  (let ((local-table (list '*table*)))

    (define (lookup key-list)
      (define (iter keys records)
        (let ((record (assoc (car keys) (cdr records))))
          (if record
              (if (null? (cdr keys))
                  (cdr record)
                  (iter (cdr keys) record))
              #f)))
      (iter key-list local-table))

    (define (make-new-list value key-list)
      (if (null? (cdr key-list))
          (cons (car key-list) value)
          (list (car key-list) (make-new-list value (cdr key-list)))))

    (define (insert! value key-list)
      (define (iter keys records)
        (let ((record (assoc (car keys) (cdr local-table))))
          (if record
              (if (null? keys)
                  (set-cdr! record value)
                  (iter (cdr keys) record))
              (set-cdr! local-table (cons (make-new-list value keys) (cdr local-table))))))
      (iter key-list local-table))

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation:
                          TABLE" m))))
    dispatch))
