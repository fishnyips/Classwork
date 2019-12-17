;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a10-interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Assignment 10 Interface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Question 1 -- copy into a10q1.rkt and replace ... with your solution.

(define-struct pnode (op arg1 arg2))
;; A Polynomial Expression Node (PNode) is a
;; (make-pnode (anyof '+ '- '*) PExp PExp)

;; A Polynomial expression (PExp) is one of:
;; * A Num
;; * 'x
;; * A PNode

(define (eval/x ex val)
  ...)

(define (poly->exp p)
  ...)
  
;; Question 2 -- copy into a10q2.rkt and replace ... with your solution.

(define-struct fnode (key val left right))
;; An FNode is a (make-fnode Str (listof Str) FBST FBST)

;; A Follower Binary Search Tree (FBST) is one of:
;; * empty
;; * (make-fnode Str (listof Str) FBST FBST)
;; Where:
;; * every key in left is less than key (using string<?)
;; * every key in right is greater than key

(define (calc-followers los)
  ...)