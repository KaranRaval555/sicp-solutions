#lang sicp

(define key car)
(define entry car)
(define left-branch cadr)
(define right-branch caddr)

(define (lookup given-key set-of-records)
  (if (null? set-of-records)
      #f
      (let* ((record (entry set-of-records))
             (rec-key (key record)))
        (cond ((= given-key rec-key) record)
              ((< given-key rec-key)
               (lookup given-key (left-branch set-of-records)))
              ((> given-key rec-key)
               (lookup given-key (right-branch set-of-records)))))))
(lookup 3 '((2 water) ((1 flour) () ()) ((3 salt) () ())))
