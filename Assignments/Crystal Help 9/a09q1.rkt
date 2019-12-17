;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a09q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 9, Question 1
;; **********************

(define-struct auto (brand power fuel))
;; An Auto is a (make-auto Str Num Num)
;; brand is the brand/manufacturer of the auto
;; power is the horsepower of the car, measured in hp
;; fuel is the fuel efficiency of the car, measured in L/100km
;; requires:
;;   power >= 0
;;   fuel >= 0

;; Some constants that may be useful in testing
(define car1 (make-auto "Toyota" 45 34.2))
(define car2 (make-auto "Apple" 33 1098))
(define car3 (make-auto "Boo" 100 100))
(define car4 (make-auto "Toyota" 5 4.2))
(define car5 (make-auto "Toyota" 8 2.2))
(define cars (list car1 car2 car3 car4 car5))
(define car6 (make-auto "BMW" 500 5.0))
(define car7 (make-auto "Nothing" 0 0))

;; (find-auto mybrand minpower maxfuel loa) produces 
;; a new list of Auto of a certain mybrand if the Auto exceeds
;; the minpower requirement and is below maxfuel from a loa (listof Auto)
;; find-auto: Str Int Int (listof Auto) -> (listof Auto)

;; Examples:
(check-expect (find-auto "Toyota" 5 89.1 cars) (list car1 car4 car5))
(check-expect (find-auto "Toyota" 5 5.0 cars)  (list car4 car5))
(check-expect (find-auto "Apple" 32.6 70 cars) empty)

(define (find-auto mybrand minpower maxfuel loa)
  (filter (lambda (car) (and (equal? mybrand (auto-brand car))
                             (<= minpower (auto-power car))
                             (>= maxfuel (auto-fuel car)))) loa))
;; Tests:
(check-expect (find-auto "Apple" 32.6 70 empty) empty) ; Empty List
(check-expect (find-auto "BMW" 500 5.0 (list car6)) (list car6))
(check-expect (find-auto "Nothing" 0 0 (list car7)) (list car7))
(check-expect (find-auto "Nothing" 5 5 (list car7)) empty)    
