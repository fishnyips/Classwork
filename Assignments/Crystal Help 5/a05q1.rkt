;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a05q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 5, Question 1
;; **********************

;; (max-score scores) produces the highest score from a list of scores
;; max-score: (listof Nat) -> Nat
;; requires: 0 <= scores <= 10
(define (max-score scores)
  (cond
    ((empty? scores) empty)
    ((empty? (rest scores)) (first scores))
    ((> (first scores) (max (first (rest scores)))) (first scores))
    (else (max-score (rest scores)))))

;; (min-score scores) produces the lowest score from a list of scores
;; min-score: (listof Nat) -> Nat
;; requires: 0 <= scores <= 10
(define (min-score scores)
  (cond
    ((empty? scores) empty)
    ((empty? (rest scores)) (first scores))
    ((< (first scores) (min (first (rest scores)))) (first scores))
    (else (min-score (rest scores)))))

;; (length scores) produces the length of a list of scores
;; length: (listof Nat) -> Nat
;; requires: 0 <= scores <= 10
(define (length-scores scores)
  (cond
    ((empty? scores) empty)
    (else (length scores))))

;; (remove-maxmin elem scores) produces a listof Nat after removing elem from
;; an input of scores
;; remove-maxmin: (listof Nat) -> (listof Nat)
;; requires: 0 <= scores <= 10
(define (remove-maxmin elem scores)
  (cond
    ((empty? scores) empty)
    ((= (first scores) elem) (rest scores))
    (else (cons (first scores) (remove-maxmin elem (rest scores))))))

;; (adjusted-list scores) produces a listof Nat after removing both the maximum and
;; lowest values from an input of scores
;; adjusted-list: (listof Nat) -> (listof Nat)
;; requires: 0 <= scores <= 10
(define (adjusted-list scores)
    (remove-maxmin (min-score scores) (remove-maxmin (max-score scores) scores)))

;; (sum-adjusted adjlist) produces the sum of an input adjlist
;; sum-adjusted: (listof Nat) -> Nat
(define (sum-adjusted adjlist)
(cond
  ((empty? adjlist) 0)
  (else (+ (first adjlist) (sum-adjusted (rest adjlist))))))

;; (averageoflist total adjlist) produces the average of an input adjlist, by dividing
;; the total of the adjlist and length of adjlist
;; averageoflist: (listof Nat) -> Nat
(define (averageoflist total adjlist)
  (cond
    ((empty? adjlist) 0)
    (else (/ (sum-adjusted adjlist) (length adjlist)))))

;;(execution-score scores) computes an average for a list of scores,
;; with the highest and lowest scores dropped
;; execution-score: (listof Nat) -> Int
;; requires: 0 <= scores <= 10

;; Examples:
(check-expect (execution-score
               (cons 6 (cons 5 (cons 9 (cons 2 empty))))) 5.5)
(check-expect (execution-score
               (cons 10 (cons 1 (cons 10 (cons 4 (cons 7 empty)))))) 7)

(define (execution-score scores)
  (averageoflist (sum-adjusted (adjusted-list scores)) (adjusted-list scores)))

;; Tests:
(check-expect (execution-score
               (cons 0 (cons 0 (cons 0 (cons 0 (cons 0 empty)))))) 0)
(check-expect (execution-score
               (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 empty)))))) 3)
(check-expect (execution-score
               (cons 10 (cons 10 (cons 10 (cons 10 (cons 10 empty)))))) 10)
