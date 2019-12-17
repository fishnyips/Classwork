;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l06q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 06, Question 4
;; **********************

;; (differences) produces a list of differences between adjacent list items from nelon
;; differences: (listof Num) -> (listof Num)

;; A nonempty list of numbers (Nelon) is either:
;; * (cons Num empty)
;; * (cons Num Nelon)

;; Examples:
(check-expect (differences (cons 25 (cons 16 (cons 9 (cons 1 (cons 4 empty)))))) (cons 9 (cons 7 (cons 8 (cons -3 empty)))))
(check-expect (differences (cons 15 empty)) empty)

(define (differences nelon)
  (cond
    ((empty? nelon) empty)
    ((equal? (length nelon) 1) empty)
    (else (cons (- (first nelon) (first (rest nelon))) (differences (rest nelon))))))

;; Tests:
(check-expect (differences (cons 0 (cons 0 empty))) (cons 0 empty))
