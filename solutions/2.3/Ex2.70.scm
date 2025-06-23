#lang sicp

(define rock-tree
  (generate-huffman-tree
   '((a 2) (boom 1) (get 2) (job 2) (na 16) (sha 3) (yip 9) (wah 1))))

(define song
  '(get a job sha na na na na na na na na
    get a job sha na na na na na na na na
    wah yip yip yip yip yip yip yip yip yip
    sha boom))

(define encoded-song (encode song rock-tree))
(length encoded-song)
encoded-song
; This encoding requires 84 bits. A fixed-length code for the eight-symbol alphabet would require log2 8 = 3 bits per symbol, and the song uses 36 symbols, so the fixed-length coded message would need at least 3×36=108 bits. Using the variable-length encoding saves about 22% storage.

