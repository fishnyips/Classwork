;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname l12-interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #f none #f () #t)))
;; Lab 12 Interface | CS 115 | 1199

;; =l12q1=
(define-struct node (key val left right))
;; A Node is a (make-node Num Str BT) BT)

;; A binary tree (BT) is either
;; * empty, or
;; * (make-node Num Str BT BT)

(define (preorder bt)
  ...)


;; =l12q2=
(define-struct binode (op arg1 arg2))
;; A binary arithmetic expression internal node (BINode) is a
;;   (make-binode (anyof '* '+ '/ '-) BinExp BinExp)

;; A binary arithmetic expression (BinExp) is one of:
;;   * a Num
;;   * a BINode

(define (count-ops bin-exp)
  ...)


;; =l12q3=
(define-struct node (key val left right))
;; A Node is a (make-node Num Str BT) BT)

;; A binary tree (BT) is either
;; * empty, or
;; * (make-node Num Str BT BT)

(define (odd-length bt)
  ...)

;; =l12q4=
(define-struct node (key val left right))
;; A Node is a (make-node Nat Str BT BT)

;; A binary tree (BT) is either
;;   * empty, or
;;   * (make-node Nat Str BT BT)

;; A binary search tree (BST) is a BT which additionally satisfies
;; the ordering property recursively:
;;   * every key in left is less than key
;;   * every key in right is greater than key

(define (is-ancestor? bst k1 k2)
  ...)


;; =l12q5=
(define-struct node (key val left right))
;; A Node is a (make-node Nat Str BT BT)

;; A binary tree (BT) is either
;;   * empty, or
;;   * (make-node Nat Str BT BT)

;; A binary search tree (BST) is a BT which additionally satisfies
;; the ordering property recursively:
;;   * every key in left is less than key
;;   * every key in right is greater than key

(define (leftmost bst)
  ...)

;; =Extras(additions to q1)=

(define (inorder bt)
  ...)

(define (postorder bt)
  ...)