#lang racket
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube a)
  (* a a a))

(define (integral-simp f a b n) 
  (define h (/ (- b a) n)) 
  (define (g k) 
    (define (c k) 
      (cond ((= k 0) 1) 
            ((= k n) 1) 
            ((even? k) 2) 
            (else 4))) 
    (* (c k) (f (+ a (* k h))))) 
  (define (inc k) (+ k 1)) 
  (/ (* (sum g 0 inc n) h) 3))

(define (inc a)
  (+ a 1))