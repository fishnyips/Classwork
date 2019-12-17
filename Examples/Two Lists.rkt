;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Two Lists|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Two Lists

;; A Unit is an (anyof 'cm 'm 'km 'in 'ft 'mi)

;; A Length is a (list Num Unit)

;; get-metres: Length -> Num
(define (get-metres l)
  (cond
    [(symbol=? (second l) 'm) (first l)]
    [(symbol=? (second l) 'km) (* (first l) 1000)]
    [(symbol=? (second l) 'cm) (/ (first l) 100)]
    [(symbol=? (second l) 'in) (get-metres (list (* 2.54 (first l)) 'cm))]
    [(symbol=? (second l) 'ft) (get-metres (list (* 12 (first l)) 'in))]
    [(symbol=? (second l) 'mi) (get-metres (list (* 5280 (first l)) 'ft))]))

;;(get-metres (list 20 'cm))

;; add-lengths: Length Length -> Length
(define (add-lengths l1 l2)
  (list (+ (get-metres l1)
           (get-metres l2))
        'm))

;; (at-least? n elem lst) produces true if elem appears at
;; least n times in lst, and false if not.
;; at-least? Nat Any (listof Any) -> Bool
;; Examples:

(check-expect (at-least? 0 'a empty) true)
(check-expect (at-least? 3 "hi" empty) false)
(check-expect (at-least? 2 'red (list 'red 'blue 'red 'green)) true)
(check-expect (at-least? 1 7 (list 5 4 0 5 3)) false)


(define (at-least? n elem lst)
  (cond
    [(zero? n) true]
    [(empty? lst) false]
    [(equal? (first lst) elem) (at-least? (sub1 n) elem (rest lst))]
    [else (at-least? n elem (rest lst))]))

;; A point is a (list Num Num)

(define (mid P Q)
  (list (/ (+ (first P) (first Q)) 2)
        (/ (+ (second P) (second Q))) 2))

;; requires: L1 and L2 have the same length
(define (midpoints L1 L2)
  (cond
    [(empty? L1) empty]
    [else (cons (mid (first L1) (first L2))
                (midpoints (rest L1) (rest L2)))]))

(define (list=? list1 list2)
  (cond
    [(empty? list1) (empty? list2)]
    [(empty? list2) false]
       [else (and (equal? (first list1) (first list2))
                  (list=? (rest list1) (rest list2)))]))