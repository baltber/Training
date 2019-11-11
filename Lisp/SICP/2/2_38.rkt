#lang racket
(define (fold-left-req op init seq)
  (if (null? seq)
      init
      (op (op init (car seq))
          (fold-left op init (cdr seq)))))

(define (fold-left op init seq)
  (define (iter result term)
    (if (null? term)
        result
        (iter (op result (car term))
              (cdr term))))
  (iter init seq))

(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (fold-right op init (cdr seq)))))

(define test1 (fold-right / 1 (list 1 2 3)))

(define test2 (fold-left / 1 (list 1 2 3)))

(define test3 (fold-right list null (list 1 2 3)))

(define test4 (fold-left list null (list 1 2 3)))