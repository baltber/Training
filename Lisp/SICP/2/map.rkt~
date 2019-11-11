#lang racket
(define (map fun items)
  (if (null? items)
      null
      (cons (fun (car items)) (map fun (cdr items)))))

(define test (map (lambda (x) (* x x)) (list 1 2 3 4 5 6)))

