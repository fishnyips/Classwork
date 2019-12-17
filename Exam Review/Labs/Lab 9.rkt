;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Lab 9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Lab 9

;; Question 1
(define (count-even-strings los)
  (length (filter even? (map string-length los))))

;; Question 2
(define (switcher char)
  (cond
    [(char-upper-case? char) (char-downcase char)]
    [(char-lower-case? char) (char-upcase char)]
    [else char]))

(define (switch-case str)
  (list->string (map switcher (string->list str))))

;; Question 3
(define (longest-string-length los)
   (foldr max 0 (map string-length los)))

;; Question 4
(define (any-senior? buddies)
  (ormap >10? buddies))

(define (>10? pet)
  (cond
    [(>= (third pet) 10) true]
    [else false]))

;; Question 5
(define (sum<? point1 point2)
  (cond
    [(empty? point1) false]
    [(empty? point2) true]
    [(< (+ (first point1) (second point1)) (+ (first point2) (second point2))) true]
    [else false]))

(define (sort-points pts)
  (sort pts sum<?))