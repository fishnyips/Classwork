;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname l12q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define-struct node (key val left right))

;; Constants
;; A small BT
(define abc-tree
  (make-node 1 "a"
             (make-node 2 "b" empty empty)
             (make-node 3 "c" empty empty)))

;; A bite-size BST, from the lab slides
(define some-bst
  (make-node 15 "Viper"
             (make-node 7 "Void"
                        (make-node 1 "Lion" empty empty)
                        (make-node 4 "Pudge" empty empty))
             (make-node 21 "Zeus"
                        (make-node 16 "Rubick" empty empty)
                        (make-node 41 "Huskar" empty empty))))

(define (preorder t)
  (cond
    [(empty? t) empty]
    [else
     (append (list (node-key t))
             (preorder (node-left t))
             (preorder (node-right t)))]))