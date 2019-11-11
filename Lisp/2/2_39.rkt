#lang racket
(define (reverse seq)
  (fold-right (lambda (x y) (append y (list x))) null seq))

(define (reverse2 seq)
  (fold-left (lambda (x y) (cons y x)) null seq))

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

(define test (reverse (list 1 2 3 4)))

(define test2 (reverse2 (list 1 2 3 4)))