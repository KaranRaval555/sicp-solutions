#lang sicp

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;; Find the two smallest weight things and replace them with a merged version
;; of the two leafs
(define (successive-merge leaf-set)
  (if (empty? (cdr leaf-set))
      (car leaf-set)
      (successive-merge
       (adjoin-set (make-code-tree (car leaf-set)
                                   (cadr leaf-set))
                   (cddr leaf-set)))))
