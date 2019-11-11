#lang racket
(define (map1 p seq)
  (acc (lambda (x y) (cons (p x) y)) null seq))

(define (app seq1 seq2)
  (acc cons seq1 seq2))

(define (length seq)
  (acc (lambda (x y) (+ 1 y))
       0
       seq))

(define (acc op init sec)
  (if(null? sec)
     init
     (op (car sec)
         (acc op init (cdr sec)))))

(define (square a) (* a a))

(define test (app (list 2 2 3 4) (list 2 2 3 4)))

(define test2 (map square (list 2 2 3 4)))

(define test3 (length (list 2 2 3 4)))