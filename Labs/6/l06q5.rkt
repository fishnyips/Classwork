;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l06q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 06, Question 5
;; **********************

(check-expect (average-filter (cons 45 (cons 55 (cons 79 empty)))) (cons 79 empty))

(define (total-grade log)
  (cond
    ((empty?  log) 0)
    (else (+ (first log) (total-grade (rest log))))))

(define (average-grade log total)
  (/ total (length log)))
  
(define (compare-grade log average)
  (cond
    ((empty? log) empty)
    ((< average (first log)) (cons (first log) (compare-grade (rest log) average)))
    (else (compare-grade (rest log) average))))

(define (average-filter log)
  (compare-grade log (average-grade log (total-grade log))))