#lang racket
(define (smallest-devizor n)
  (find-devizor n 2))

(define (find-devizor n test-devizor)
  (cond ((> (square test-devizor) n)n)
        ((devides? n test-devizor) test-devizor)
        (else (find-devizor n (+ test-devizor 1)))))

(define (devides? a b)
  (= (remainder a b) 0))

(define (square a)
  (* a a))