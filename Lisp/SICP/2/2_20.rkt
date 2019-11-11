#lang racket
(define (same-parity first . other)
  (define (accept? value)
    (equal? (even? first) (even? value)))
  (define (filter values)
    (cond ((null? values) null)
          ((accept? (car values)) (cons (car values) (filter (cdr values))))
          (else (filter (cdr values)))))
    (cons first (filter other)))

(define test (same-parity 1 2 3 4 5 6 7))

