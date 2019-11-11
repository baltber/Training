#lang racket
(define (tree-map fun tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map fun sub-tree)
             (fun sub-tree)))
       tree))

(define (square-tree tree) (tree-map square tree))

(define (square a) (* a a))

(define test (square-tree (list 1 (list 2 (list 3 4)))))