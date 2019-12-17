;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname l07q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 07, Question 5
;; **********************


;; "Constructor" function
(define (makepricelist item price num)
  (list item price num))

;; "Selectors" Select a field
(define (item s) (first s))
(define (price s) (second s))
(define (num s) (third s))

(define (total-price-list lol)
  (cond
    [(empty? lol) empty]
    [else (list (item (first lol))
                (total-price-list (rest lol)))]))



