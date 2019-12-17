;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l03q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 03, Question 3
;; **********************


;; (last-char) produces the last character of a nonempty string str
;; last-char: Str -> Str
;; requires str != ""

;; Examples
(check-expect(last-char "abc")"c")
(check-expect(last-char "-tony")"y")


(define (last-char str)
  (substring str (- (string-length str) 1)))

;; Tests
(check-expect(last-char "-")"-")
(check-expect(last-char "text ")" ")