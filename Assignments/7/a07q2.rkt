;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a07q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 7, Question 2
;; **********************

;; (my-remove-all n alon) produces list with all occurences of n
;; removed from alon.
;; my-remove-all: Int (listof Int) -> (listof Int)

(define (my-remove-all n alon)
  (cond
    ((empty? alon) empty)
    ((= n (first alon)) (my-remove-all n (rest alon)))
    (else (cons (first alon) (my-remove-all n (rest alon))))))

;; (singles alon) produces list with only the unique integers
;; of list alon
;; singles: (listof Int) -> (listof Int)
(define (singles alon)
  (cond
    [(empty? alon) empty]
    (else (cons (first alon) (my-remove-all (first alon) (singles (rest alon)))))))

;; (newL1 L1 L2) produces a non-duplicate list from L1 and L2, with no values equal
;; to any values in L3
;; newL1: (listof Int) (listof Int) -> (listof Int)
(define (newL1 L1 L2)
  (singles
   (cond
    [(or (empty? L1) (empty? L2)) empty]
    [(not (member? (first L1) (combinedL3 L1 L2)))
     (append (list (first L1)) (newL1 (rest L1) L2))]
    [else (newL1 (rest L1) L2)])))

;; (newL2 L1 L2) produces a non-duplicate list from L1 and L2, with no values equal
;; to any values in L3
;; newL2: (listof Int) (listof Int) -> (listof Int)
(define (newL2 L1 L2)
  (singles
   (cond
    [(or (empty? L1) (empty? L2)) empty]
    [(not (member? (first L2) (combinedL3 L1 L2)))
     (append (list (first L2)) (newL2 L1 (rest L2)))]
    [else (newL2 L1 (rest L2))])))

;; (combinedL3 L1 L2) produces a list which contains values that are present in
;; both L1 and L2
;; combinedL3: (listof Int) (listof Int) -> (listof Int)
(define (combinedL3 L1 L2)
  (cond
    [(or (empty? L1) (empty? L2)) empty]
    [(and (member? (first L1) L2) (member? (first L1) L1))
     (append (list (first L1)) (combinedL3 (rest L1) L2))]
    [(and (member? (first L2) L1) (member? (first L2) L2))
     (append (list (first L2)) (combinedL3 L1 (rest L2)))]
    [else (combinedL3 (rest L1) (rest L2))]))

;; (newcombinedL3 L1 L2) produces a unique list of int which are members of both L1
;; and L2
;; newcombinedL3: (listof Int) (listof Int) -> (listof Int)
(define (newcombinedL3 L1 L2)
  (singles (combinedL3 L1 L2)))

;; (list-of-lists L1 L2) produces a list of 3 lists:
;; first list consists of int present only in L1
;; second list consists of int present only in L2
;; third list consists of int that are in both L1 and L2

;; Examples:
(check-expect (list-of-lists (list 2 1 -4 3) (list 2 3 5 -9))
              (list (list 1 -4) (list 5 -9) (list 2 3)))

(check-expect (list-of-lists (list 1 1 1) (list 1 2 2 2 2))
              (list empty (list 2) (list 1)))

(check-expect (list-of-lists (list 3 2 1) (list 4 5))
              (list (list 3 2 1) (list 4 5) empty))

(define (list-of-lists L1 L2)
  (list (newL1 L1 L2) (newL2 L1 L2) (newcombinedL3 L1 L2)))

;; Tests:
(check-expect (list-of-lists (list 0) (list 0)) (list empty empty (list 0)))
(check-expect (list-of-lists (list -1) (list -2)) (list (list -1) (list -2) empty))
(check-expect (list-of-lists (list -5) (list 10)) (list (list -5) (list 10) empty))
(check-expect (list-of-lists (list 1 2 3 0) (list 1 2 3)) (list (list 0) empty (list 1 2 3)))
