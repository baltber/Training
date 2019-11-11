#lang racket
(define (acc-n op init seq)
  (if (null? (car seq))
      null
      (cons (acc op init (map car seq))
            (acc-n op init (map cdr seq)))))


(define (acc op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (acc op init (cdr seq)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(define test (acc-n + 0 s))
