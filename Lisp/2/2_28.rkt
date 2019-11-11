#lang racket
(define (fringe tree) 
  (cond ((null? tree) '()) 
        ((list? tree) (append (fringe (car tree)) 
                      (fringe (cdr tree)))) 
        (else (list tree))))

(define x (list (list 1 2 5) (list 3 4 3) (list 3 4 3)))

(define test (cdr x))