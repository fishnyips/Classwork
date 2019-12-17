;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l06) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 05, Question 6
;; **********************

;;Examples:
(check-expect(next-list (cons 2 (cons "a" (cons -4 (cons 2 empty)))) 2) "a")

(define (next-list alist item)
  (cond
    ((empty? alist) "None")
    ((equal? (first alist) item) (first (rest alist)))
    ((equal? (last-item alist item) item) "None")
        (else (next-list (rest alist) item))))

(define (last-item alist item)
  (cond
    ((empty? alist) "None")
     ((zero? (length (rest alist))) (first alist))
     (else (last-item (rest alist) item))))



    