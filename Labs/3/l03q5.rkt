;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l03q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 03, Question 5
;; **********************


;; (fullweeks) produces the rounded down number of weeks parked at the airport consuming day-num
;; fullweeks: Nat -> Nat

(define (fullweeks day-num)
  (quotient day-num 7))

;; (remaining-days) produces the remaining days parked based on day-num
;; remaining-days: Nat -> Nat

(define (remaining-days day-num)
  (remainder day-num 7))

;; (airport-parking) produces the total cost of parking at the airport based on day-num
;; airport-parking Int -> Num
;; requires day-num >= 0

;; Examples:
(check-expect(airport-parking 15)164.85)
(check-expect(airport-parking 20)239.6)

(define (airport-parking day-num)
  (+ (* 74.95 (fullweeks day-num))
  (* 14.95 (remaining-days day-num))))

;; Tests:
(check-expect(airport-parking 0)0)
