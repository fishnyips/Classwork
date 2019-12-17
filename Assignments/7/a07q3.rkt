;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a07q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 7, Question 3
;; **********************

;; (password alos aloi) produces a Str representing a password generated with
;; the following rules:
;; Each Str in alos, extract the index indicated from the Int in aloi
;; If aloi runs out of Int in aloi, take the first Char of the remaining
;; Str in alos
;; If alos runs out of Str in alos, the password is complete,
;; ignore the rest of Int in aloi
;; If Int doesn't exist as an index for the given Str, skip the Int and continue with
;; the rest of aloi

;; Examples:
(check-expect (password (list "abc" "dogs" "!?!")
                        (list 0 3 2)) "as!")
(check-expect (password (list "abc" "dogs" "xyz" "help")
                        (list 0 3)) "asxh")
(check-expect (password (list "abc" "hello" "xyz")
                        (list 0 3 0 4 2 3 4)) "alx")
(check-expect (password (list "abc")
                        (list 5 0)) "a")

(define (password alos aloi)
  (cond
    [(empty? alos) ""]
    [(empty? aloi) (string-append (substring (first alos) 0 1)
                                  (password (rest alos) empty))]
    [(and (< (first aloi) (string-length (first alos)))
          (>= (first aloi) 0))
     (string-append (substring (first alos) (first aloi) (add1 (first aloi)))
                    (password (rest alos) (rest aloi)))]
    [else (password alos (rest aloi))]))

;; Tests:
(check-expect (password (list "abc" "125" "xyz" "hello" "lawnmower")
                        (list 0 2 3 1 4 4 4 5 5)) "a5yom")
(check-expect (password (list "help" "me" "now" "!!!")
                        (list 0 1)) "hen!")
(check-expect (password (list "does" "this" "work?")
                        (list -2 1 7)) "otw")
(check-expect (password (list "a" "B" "!")
                        (list 0 0 0)) "aB!")
(check-expect (password (list "abcd" "edg")
                        (list -1 0)) "ae")