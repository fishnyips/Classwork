;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a07q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 7, Question 1
;; **********************

;; (vacations destinations prices budget) consumes a list of destinations and prices
;; and produces a list of destinations that are available for travel which are under
;; the budget
;; vacations -> (listof Str) (listof Nat) Nat -> (listof Str)

;; Examples:
(check-expect (vacations (list "Maldives") (list 1599) 250) empty)
(check-expect (vacations (list "Maldives") (list 1599) 1599) (list "Maldives 1599"))
(check-expect (vacations (list "Alberta" "BC" "Manitoba")
                         (list 500 459 300) 460) (list "BC 459" "Manitoba 300"))

(define (vacations destinations prices budget)
  (cond
    [(or (empty? destinations) (empty? prices)) empty]
    [(<= (first prices) budget)
     (append (list (string-append (first destinations) " " (number->string (first prices))))
           (vacations (rest destinations) (rest prices) budget))]
    [else (vacations (rest destinations) (rest prices) budget)]))
    
;; Tests:
(check-expect (vacations (list "Toronto") (list) 250) empty)
(check-expect (vacations (list) (list 1250) 250) empty)
(check-expect (vacations (list "India") (list 1000) 0) empty)
(check-expect (vacations (list "Australia") (list 0) 0) (list "Australia 0"))
  

