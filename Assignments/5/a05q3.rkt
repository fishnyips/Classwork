;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a05q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 5, Question 3
;; **********************

(define (remove-zero lon)
  (cond
    ((empty? lon) empty)
    ((equal? (first lon) 0)
     (remove-zero (rest lon)))
    (else (cons (first lon) (remove-zero (rest lon))))))

(define (combine-number lon)
  (cond
    ((empty? (second lon)) (first lon))
    ((= (first lon) (second lon))
     (combine-number (cons (+ (first lon) (first (rest lon))) (rest (rest lon)))))
    (else (cons (first lon) (combine-number (rest lon))))))

