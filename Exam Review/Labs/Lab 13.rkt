;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Lab 13|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (llt-template l)
  (cond
    [(empty? l) ...]
    [(cons? (first l))
     (... (llt-template (first l)) ...
          (llt-template (rest l))...)]
    [else (... (first l) ... (llt-template (rest l)))]))

;; Count Leaves
(define (count-leaves l)
  (cond
    [(empty? l) 0]
    [(cons? (first l))
     (+ (count-leaves (first l))
        (count-leaves (rest l)))]
    [else (+ 1 (first l) (count-leaves (rest l)))]))

;; Flatten
(define (flatten l)
  (cond
    [(empty? l) empty]
    [(cons? (first l))
     (append (flatten (first l))
             (flatten (rest l)))]
    [else (cons (first l) (flatten (rest l)))]))

;; Depth
(define (depth llt)
  (cond
    [(empty? llt) 0]
    [(cons? (first llt))
     (max (+ 1 (depth (first llt)))
        (depth (rest llt)))]
    [else (max 1 (depth (rest llt)))]))

;; Concat-strings
(define (concat-strings llt sep)
  (cond
    [(empty? llt) empty]
    [(string? (first llt))
     (string-append (first llt) sep (concat-strings (rest llt) sep))]
    [else (flatten (string-append (concat-strings (rest llt) sep)))]))

     