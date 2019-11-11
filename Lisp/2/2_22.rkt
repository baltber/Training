#lang racket
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (* (car things) (car things))))))
  (iter items null))

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                    (list (* (car things) (car things)))))))
  (iter items null))

(define test (square-list2 (list 1 2 3 4 5)))

(define (square a) (* a a))