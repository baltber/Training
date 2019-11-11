#lang racket
(define (make-mobil left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (branch-weight branch)
  (let ((struct (branch-structure branch)))
    (if (pair? struct)
        (total-weight struct)
        struct)))

(define (total-weight tree)
  (+ (branch-weight (left-branch tree))
     (branch-weight (right-branch tree))))

(define (total-branch-length branch)
  (let ((struct (branch-structure branch)))
    (if (pair? struct)
        (total-length struct)
        struct)))

(define (total-length tree)
  (+ (total-branch-length (left-branch tree))
     (total-branch-length (right-branch tree))))

(define (balanse? tree)
  (= (* (branch-weight (left-branch tree)) (total-branch-length (left-branch tree)) )
     (* (branch-weight (right-branch tree)) (total-branch-length (right-branch tree)))))

(define (balanced? mobile) 
  (define (branch-balanced? branch) 
    (if (pair? (branch-structure branch)) 
        (balanced? (branch-structure branch)) 
        true)) 
  (define (torque branch) 
    (* (branch-length branch) (branch-weight branch))) 
  (let ((left (left-branch mobile)) 
        (right (right-branch mobile))) 
    (and (branch-balanced? left) 
         (branch-balanced? right) 
         (= (torque left) (torque right)))))

