#lang racket
(define (horner-eval x coeff-seq)
  (acc (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
       0
       coeff-seq))


(define (acc op init sec)
  (if(null? sec)
     init
     (op (car sec)
         (acc op init (cdr sec)))))

(define test (horner-eval 2 (list 1 3 0 5 0 1)))
