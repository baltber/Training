#lang racket
(define a 1)
(define b 2)

(define c (list 'a 'b))

(define d (list 'a 'b 'c 'd))
(define e (list 'a 'b 'c 'd))

(define (memq a l)
  (cond ((null? l) false)
        ((eq? a (car l)) l)
        (else (memq a (cdr l)))))

(define (equal? l1 l2)
  (or
   (and (null? l1)
        (null? l2))
   (and (number? l1)
        (number? l2)
        (= l1 l2))
   (and (symbol? l1)
        (symbol? l2)
        (eq? l1 l2))
   (and (pair? l1)
           (pair? l2)
           (equal? (car l1) (car l2))
           (equal? (cdr l1) (cdr l2)))))
