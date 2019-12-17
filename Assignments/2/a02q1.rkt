;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 02, Question 1
;; **********************

;; (first-trim) produces a trimmed s, taking off front amount of characters
;; first-trim: Str -> Str

(define (first-trim s front)
  (substring s (min (string-length s) front)))

;; (trim) produces a trimmed s, taking off front amount of characters from the beginning
;; of the string and back amount of characters from the end of the string
;; requires: nonempty s

;; Examples:
(check-expect(trim "abcdefghi" 2 3) "cdef")
(check-expect(trim "abcdef" 3 5) "")

(define (trim s front back)
  (substring (first-trim s front) 0
             (max (- (string-length(first-trim s front)) back) 0)))

;; Tests:
(check-expect(trim "ab" 3 3) "")
(check-expect(trim "abc" 0 0)"abc")
(check-expect(trim "abc" 1 5)"")
