#lang racket
(define (deep-revers list)
  (define (deep-revers-iter source result)
    (define (revers-it element)
    (if (list? element)
        (deep-revers element)
        element))
  (if (null? source)
      result
      (deep-revers-iter (cdr source) (cons (revers-it(car source)) result))))
  (deep-revers-iter list null))

(define x (list (list 1 2) (list 3 4)))

(define test (deep-revers x))