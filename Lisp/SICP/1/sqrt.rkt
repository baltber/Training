#lang racket
(define (sqrt x)
  (define (good? g)
    (< (abs (- (square g) x)) 0.0001))
  (define (improve g)
    (average g (/ x g)))
  (define (sqrt-iter g)
    (if (good? g)
        g
        (sqrt-iter (improve g))))
  (sqrt-iter 1.0))

(define (square a) (* a a))

(define (average a b)
  (/(+ a b) 2))