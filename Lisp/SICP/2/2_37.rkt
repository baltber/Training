#lang racket

(define (dot-product v w)
  (acc +
       0
       (map * v w)))

(define (transpose mat)
  (acc-n cons null mat))


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

(define m (list 1 2 3))
(define test (transpose m))