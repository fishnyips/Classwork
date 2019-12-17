;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a05q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 5, Question 3
;; **********************

;; (remove-zero lon) produces a list for the inputs lon, but with all instances
;; of 0 removed
;; remove-zero: (listof Nat) -> (listof Nat)
(define (remove-zero lst)
  (cond
    ((empty? lst) empty)
    ((equal? (first lst) 0)
     (remove-zero (rest lst)))
    (else (cons (first lst) (remove-zero (rest lst))))))

;; (combine-num prev lst) produces a list of the sum of the inputs prev, which is the previous element checked
;; and first element of lst
;; combine-num: (listof Nat) -> (listof Nat)
(define (combine-num prev lst)
  (cond
    ((empty? lst) (cons prev empty))
    ((zero? prev) (combine-num (first lst) (rest lst)))
    ((= (first lst) prev)
     (combine-num (+ prev (first lst)) (rest lst)))
    (else (cons prev (combine-num (first lst) (rest lst))))))

;; (pad count) produces a count of zeros required to append to adjusted list after all consecutive identical values
;; are combined
;; pad: Nat -> (listof Nat)
(define (pad count)
  (cond
    ((zero? count) empty)
    (else (append (cons 0 empty) (pad (sub1 count))))))

;; (add-zero adjlst lst) produces a listof Nat with zeros to restore the input adjlst to the original input lst length
;; add-zero: (listof Nat) -> (listof Nat)
(define (add-zero adjlst lst)
 (cond
    ((< (length adjlst) (length lst))
     (pad (- (length lst) (length adjlst))))
    (else empty)))

;; (slide-left lst) produces a listof Nat with all consecutive identical values combined from input lst, with zeros
;; added to the end to ensure the length is the same

;; Examples
(check-expect (slide-left empty) empty)
(check-expect (slide-left (cons 4 (cons 4 (cons 4 (cons 1 (cons 1  empty)))))) (cons 8 (cons 4 (cons 2 (cons 0 (cons 0 empty))))))
(check-expect (slide-left (cons 8 (cons 8 (cons 8 (cons 8 empty))))) (cons 16 (cons 16 (cons 0 (cons 0 empty)))))
(check-expect (slide-left (cons 2 (cons 1 (cons 2 (cons 0 empty))))) (cons 2 (cons 1 (cons 2 (cons 0 empty)))))
    
(define (slide-left lst)
  (cond
    ((empty? lst) empty)
    (else (append (combine-num (first lst) (rest lst)) (add-zero (combine-num (first lst) (rest lst)) lst)))))

;; Tests
(check-expect (slide-left (cons 8 (cons 8 (cons 0 (cons 0 empty))))) (cons 16 (cons 0 (cons 0 (cons 0 empty)))))
(check-expect (slide-left (cons 0 (cons 0 (cons 0 (cons 0 empty))))) (cons 0 (cons 0 (cons 0 (cons 0 empty)))))    
(check-expect (slide-left (cons 3 (cons 3 (cons 0 (cons 0 empty))))) (cons 6 (cons 0 (cons 0 (cons 0 empty)))))     

