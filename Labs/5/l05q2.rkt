;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l05q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 05, Question 2
;; **********************

;; count-even-strings produces the number of strings in list los that have an even length
;; count-even-strings (listof Str) -> Nat  

;; Examples:
(check-expect(count-even-strings (cons "cs" (cons "115" (cons "" empty))))2)

(define (count-even-strings los)
  (cond
    [(empty? los) 0]
    [(zero? (remainder (string-length(first los))2) )
        (+ 1 (count-even-strings (rest los)))]
    [else (count-even-strings (rest los))]))

;; Tests:
(check-expect(count-even-strings (cons "tony" (cons "00" (cons "" empty))))3)
