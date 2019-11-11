#lang racket
(define (square-tree1 tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree1 (car tree))
                    (square-tree1 (cdr tree))))))

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
       tree))

(define (square a) (* a a))

(define test (square-tree (list 1 (list 2 (list 3 4)))))
(define test1 (square-tree1 (list 1 (list 2 (list 3 4)))))