;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a05q1final) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 5, Question 1
;; **********************

(define (max-score scores)
  (cond
    ((empty? scores) empty)
    ((empty? (rest scores)) (first scores))
    ((> (first scores) (max (first (rest scores)))) (first scores))
    (else (max-score (rest scores)))))

(define (min-score scores)
  (cond
    ((empty? scores) empty)
    ((empty? (rest scores)) (first scores))
    ((< (first scores) (min (first (rest scores)))) (first scores))
    (else (min-score (rest scores)))))

(define (length-scores scores)
  (cond
    ((empty? scores) empty)
    (else (length scores))))

(define (remove-maxmin elem scores)
  (cond
    ((empty? scores) empty)
    ((= (first scores) elem) (rest scores))
    (else (cons (first scores) (remove-maxmin elem (rest scores))))))

(define (adjusted-list scores)
    (remove-maxmin (min-score scores) (remove-maxmin (max-score scores) scores)))

(define (sum-adjusted adjlist)
(cond
  ((empty? adjlist) 0)
  (else (+ (first adjlist) (sum-adjusted (rest adjlist))))))

(define (averageoflist total adjlist)
  (cond
    ((empty? adjlist) 0)
    (else (/ (sum-adjusted adjlist) (length adjlist)))))

;; TODO: Check what the contract is for a natural number

;;(execution-score) computes an average score for a list of scores,
;; with the highest and lowest scores dropped
;; execution-score: (listof Nat) -> Nat
;; requires: 0 <= scores <= 10

(define (execution-score scores)
  (averageoflist (sum-adjusted (adjusted-list scores)) (adjusted-list scores)))