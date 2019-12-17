;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l04q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 04, Question 4
;; **********************

;;(new-string) produces a new string using original and add-on depending on the position
;; newstring: Str Str Str -> Str

;; Examples:
(check-expect(new-string "bat" "man" "after")"batman")
(check-expect(new-string "bat" "man" "before")"manbat")

(define (new-string original add-on position)
  (cond[(string=? position "after") (string-append original add-on)]
    (else(string-append add-on original))))

;; Tests:
(check-expect(new-string "basket" "ball" "after")"basketball")