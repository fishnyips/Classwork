;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l04q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 04, Question 5
;; **********************

;;(last-letter) produces the last character of string1
;; last-letter: Str -> Str
(define (last-letter string1)
  (substring string1 (- (string-length string1) 1)))

;;(first-letter) produces the first character of string2
;;first-letter: Str -> Str
(define (first-letter string2)
  (substring string2 0 1))

;;(connect?) produces a boolean based on the last letter of string 1 and first letter of string 2
;; connect?: Str -> Str
;; requires string1 and string2 to be non-empty

;; Examples:
(check-expect(connect? "abc" "c")true)
(check-expect(connect? "hi" "hello")false)

(define (connect? string1 string2)
    (string=?(last-letter string1) (first-letter string2)))

;; Tests:
(check-expect(connect? "tony" "c")false)