;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname module2b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; (mid t) produces the integer part of (string-length t)/2
;; mid: Str -> Nat
;; Examples:

(check-expect(mid"cs115")2)

(define (mid t)(quotient(string-length t)2))
(check-expect (mid "A") 0)

;; Extracting the front
(check-expect(front-part "angle")"an")

(define(front-part s)(substring s 0 (mid s)))

;; Extracting the back
(check-expect(back-part "angle")"gle")

(define(back-part s)(substring s (mid s)))

;; Swapping Front and Back
(define(swap-parts s)
  (string-append (back-part s)(front-part s)))

(check-expect(swap-parts "angle")"glean")