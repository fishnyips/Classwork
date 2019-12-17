;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Lab 12 - Round 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Lab 12 round 2

(define-struct node (key val left right))
(define-struct binode (op arg1 arg2))

(define some-bst
  (make-node 15 "Viper"
             (make-node 7 "Void"
                        (make-node 1 "Lion" empty empty)
                        (make-node 4 "Pudge" empty empty))
             (make-node 21 "zeus"
                        (make-node 16 "Rubick" empty empty)
                        (make-node 41 "Huskar" empty empty))))

(define (preorder bt)
  (cond
    [(empty? bt) empty]
    [else
     (append (list (node-key bt))
                (preorder (node-left bt))
                (preorder (node-right bt)))]))

(define (count-ops bin-exp)
  (cond
    [(number? bin-exp) 0]
    [else (+ 1 (count-ops (binode-arg1 bin-exp))
             (count-ops (binode-arg2 bin-exp)))]))

(define (odd-length bt)
  (cond
    [(empty? bt) empty]
    [(odd? (string-length (node-val bt)))
     (make-node (node-key bt)
                "odd"
                (odd-length (node-left bt))
                (odd-length (node-right bt)))]
    [else
     (make-node (node-key bt)
                (node-val bt)
                (odd-length (node-left bt))
                (odd-length (node-right bt)))]))

(define (leftmost bst)
  (cond
    [(empty? (node-left bst)) bst]
    [else (leftmost (node-left bst))]))

