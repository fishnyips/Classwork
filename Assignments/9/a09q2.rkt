;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a09q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 9, Question 2
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

(define (best-auto loa) ...)