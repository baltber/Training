#lang racket
(define (square-list1 items)
  (if (null? items)
      null
      (cons (* (car items) (car items))(square-list1 (cdr items)))))

(define (square-list2 items)
  (map (lambda (x) (* x x)) items))

(define test1 (square-list1 (list 1 2 3 4 5)))
(define test2 (square-list2 (list 1 2 3 4 5)))