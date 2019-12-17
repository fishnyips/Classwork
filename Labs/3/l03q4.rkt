;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l03q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 03, Question 4
;; **********************

;; (shipping-bill) produces the total cost of shipping merchandise by using handling, charge-per-kg, weight and boxes
;; shipping-bill: Nat Num Num Num -> Num
;; requires: handling = 100, charge-per-kg >= 0, weight >= 0, boxes >= 0

;; Examples:
(check-expect(shipping-bill 100 2 5 6)160)
(check-expect(shipping-bill 100 3 4 5)160)

(define handling 100)

(define (shipping-bill handling charge-per-kg weight boxes)
  (+ handling (* charge-per-kg weight boxes)))

;; Tests:
(check-expect(shipping-bill 100 0 0 0) 100)


