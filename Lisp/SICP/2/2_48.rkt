#lang racket

(define (for-each fun items)
  (cond (( not (null? items))
      (fun (car items)) (for-each fun (cdr items)))))

(define wave2 (beside wave (flip-vert wave)))
(define wave4-old (below wave2 wave2))

(define (flipped-pairs-old painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(define wave4 (fliped-pairs-old wave))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below (bottom-right corner)))))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (square-limit-old painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (flipped-pairs painter)
  (let ((combine4 (square-of-four identity flip-vert
                                  identity flip-vert)))
    (combine4 painter)))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
                                  rotate180 flip-vert)))
    (combine4 (corner-split painter n))))

(define (split f1 f2)
  (define (split-iter painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-iter painter (- n 1))))
          (f1 painter (f2 smaller smaller)))))
  (split-iter))

(define (frame-cord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (make-vect
   (+ (xcor-vect v1) (xcor-vect v2))
   (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect
   (- (xcor-vect v1) (xcor-vect v2))
   (- (ycor-vect v1) (ycor-vect v2))))


(define (scale-vect s v)
  (make-vect
   (* s (xcor-vect v))
   (* s (ycor-vect v))))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))


(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

(define (make-segment v1 v2)
  (cons v1 v2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (segments->painer segment-list)
  (lambda (frame)
    (for-each
     (lambda(segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     (segment-list))))

(define (around-segment)
  (segments->painter list (make-segment (make-vect 0 0)
                                        (make-vect 1 0))
                          (make-segment (make-vect 1 0)
                                        (make-vect 1 1))
                          (make-segment (make-vect 1 1)
                                        (make-vect 0 1))
                          (make-segment (make-vect 0 1)
                                        (make-vect 0 0))))

(define (X-segment)
  (segments->painter list (make-segment (make-vect 0 0)
                                        (make-vect 1 1))
                          (make-segment (make-vect 0 1)
                                        (make-vect 1 0))))

(define (romb-segment)
  (segments->painter list (make-segment (make-vect 0.5 0)
                                        (make-vect 0 0.5))
                          (make-segment (make-vect 0 0.5)
                                        (make-vect 0.5 1))
                          (make-segment (make-vect 0.5 1)
                                        (make-vect 1 0.5))
                          (make-segment (make-vect 1 0.5)
                                        (make-vect 0.5 0))))

(define (polyline vectors) 
    (if (null? (cdr vectors)) 
        null 
        (cons (make-segment (car vectors) (cadr vectors)) 
              (polyline (cdr vectors)))))


(define (contour vectors) 
  (polyline (append vectors 
                    (list (car vectors))))

(define wave-painter 
  (segments->painter 
    (append (polyline (make-vect 0 0.15) 
                      (make-vect 0.15 0.4) 
                      (make-vect 0.3 0.35) 
                      (make-vect 0.4 0.35) 
                      (make-vect 0.35 0.15) 
                      (make-vect 0.4 0)) 
            (polyline (make-vect 0.6 0) 
                      (make-vect 0.65 0.15) 
                      (make-vect 0.6 0.35) 
                      (make-vect 0.75 0.35) 
                      (make-vect 1 0.65)) 
            (polyline (make-vect 1 0.85) 
                      (make-vect 0.6 0.55) 
                      (make-vect 0.75 1)) 
            (polyline (make-vect 0.6 1) 
                      (make-vect 0.5 0.7) 
                      (make-vect 0.4 1)) 
            (polyline (make-vect 0.25 1) 
                      (make-vect 0.35 0.5) 
                      (make-vect 0.3 0.4) 
                      (make-vect 0.15 0.6) 
                      (make-vect 0 0.35)))))



