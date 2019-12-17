;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a09q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
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

;; (best-auto loa) produces an Auto with the best properties of loa
;; * Brand of Auto that occurs last alphabetically
;; * Maximum Power of any Auto
;; * Minimum fuel consumption of all Auto
;; best-auto: (listof Auto) -> Auto
;; requires: loa to be non-empty

;; Examples:
(check-expect (best-auto cars) (make-auto "Toyota" 100 2.2)) 
(check-expect (best-auto (list car2 car3)) car3)
              
(define (best-auto loa)
  [local
    [;; (best-auto-name best-name loa) produces the last alphabetical
     ;; name in a loa
     ;; best-auto-name: Str (listof Auto) -> Str
     (define (best-auto-name best-name loa)
  (cond
    ((empty? loa) best-name)
    ((string<? best-name (auto-brand (first loa)))
     (best-auto-name (auto-brand (first loa)) (rest loa)))
    (else (best-auto-name best-name (rest loa)))))
     ;; (best-auto-power best-power loa) produces the highest power
     ;; in a loa
     ;; best-auto-power: Int (listof Auto) -> Int
     (define (best-auto-power best-power loa)
  (cond
    ((empty? loa) best-power)
    ((<= best-power (auto-power (first loa)))
     (best-auto-power (auto-power (first loa)) (rest loa)))
    (else (best-auto-power best-power (rest loa)))))
     ;; (best-auto-fuel best-fuel loa) produces the lowest fuel consumption
     ;; in a loa
     ;; best-auto-fuel: Int (listof Auto) -> Int
     (define (best-auto-fuel best-fuel loa)
  (cond
    ((empty? loa) best-fuel)
    ((>= best-fuel (auto-fuel (first loa)))
     (best-auto-fuel (auto-fuel (first loa)) (rest loa)))
    (else (best-auto-fuel best-fuel (rest loa)))))]
  (make-auto (best-auto-name (auto-brand (first loa)) loa)
             (best-auto-power (auto-power (first loa)) loa)
             (best-auto-fuel (auto-fuel (first loa)) loa))])

;; Tests:
(check-expect (best-auto (list car2 car3 car4)) (make-auto "Toyota" 100 4.2))
(check-expect (best-auto (list car1 car2 car3 car4)) (make-auto "Toyota" 100 4.2))
(check-expect (best-auto (list car4 car5)) (make-auto "Toyota" 8 2.2))




