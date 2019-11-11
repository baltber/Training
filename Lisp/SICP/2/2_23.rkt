#lang racket
(define (for-each fun items)
  (cond (( not (null? items))
      (fun (car items)) (for-each fun (cdr items)))))

(define test (for-each
              (lambda (x) (newline) (display x))
              (list 1 2 3 4 5)))