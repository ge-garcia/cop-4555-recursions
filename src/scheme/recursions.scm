(define (->binary n)
  (unless (and (integer? n) (>= n 0))
    (error "->binary: expected a natural number, got" n))
  (if (< n 2)
      (number->string n)
      (string-append (->binary (quotient n 2))
                     (number->string (remainder n 2)))))

(define (display-to-binary n)
  (display (string-append (number->string n) " -> " (->binary n)))
  (newline))

(for-each display-to-binary (iota 16 0))
