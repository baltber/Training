#lang racket
(define (count-leaves t)
  (acc +
       0
       (map (lambda (x)
              (if (pair? x)
                  (count-leaves x)
                  1))
            t)))

(define (acc op init sec)
  (if(null? sec)
     init
     (op (car sec)
         (acc op init (cdr sec)))))

(define tree (cons (list 1 2) (list 3 4)))

(define test (count-leaves tree))
