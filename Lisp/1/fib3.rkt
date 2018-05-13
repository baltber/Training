#lang racket
(define (f n) 
   (define (iter a b c count) 
     (if (= count 0) 
       a 
       (iter b c (+ c a b) (- count 1)))) 
   (iter 0 1 2 n))
