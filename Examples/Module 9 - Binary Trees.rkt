;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Module 9 - Binary Trees|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

(define-struct binode (op arg1 arg2))
;; A Binary Arithmetic Expression Internal Node (BINode)
;;   is a (make-binode (anyof '+ '- '* '/) BinExp BinExp)

;; A Binary Arithmetic Expression (BinExp) is one of:
;; * Num
;; * A BINode

;;(make-binode '/ (make-binode '+ (make-binode '* 2 6) (make-binode '* 5 2))
;;             (make-binode '- 5 3)) ; Example from class

;; binexp-template: BinExp -> Any
;;(define (binexp-template ex)
;;  (cond
;;    [(number? ex) ...]
;;    [else ... (binode-op ex) ...
;;          ... (binode-template (binode-arg1 ex)) ...
;;          ... (binode-template (binode-arg2 ex))...]))

;; (eval ex) produces the simplified value of ex
;; eval: BinExp -> Num
;; Requires: No Division by 0
;; Examples:
(check-expect (eval 5) 5)
(check-expect (eval (make-binode '+ 2 (make-binode '- 5 3))) 4)

(define (eval ex)
  (cond
    [(number? ex) ex]
    [else
     [local
       [(define arg1-result (eval (binode-arg1 ex)))
        (define arg2-result (eval (binode-arg2 ex)))
        (define op (binode-op ex))]
       (cond
         [(symbol=? op '+) (+ arg1-result arg2-result)]
         [(symbol=? op '-) (- arg1-result arg2-result)]
         [(symbol=? op '*) (* arg1-result arg2-result)]
         [(symbol=? op '/) (/ arg1-result arg2-result)])]]))

(define-struct node (key val left right))
;; A Node is a (make-node Nat Str BT BT)

;; A Binary Tree (BT) is one of:
;; * empty
;; * A Node (make-node Nat Str BT BT)
;; satisfies ordering propery
;; left must be less than key
;; right muts be greater than key

;; bt-template: BT -> Any
;;(define (bt-template t)
;;  (cond
;;    [(empty? t) ...]
;;    [else ... (bt-key t)...
;;          ... (bt-val t)...
;;          ... (bt-template (bt-left t))...
;;          ... (bt-template (bt-right t)) ...]))

;; leaf?: BT -> Bool
(define (leaf? t)
  (and (not (empty? t))
       (empty? (node-left t))
       (empty? (node-right t))))

;; count-leaves: BT -> Nat
(define (count-leaves t)
  (cond
    [(empty? t) 0]
    [(leaf? t) 1]
    [else (+ (count-leaves (node-left t))
             (count-leaves (node-right t)))]))

(count-leaves (make-node 1 "a" (make-node 2 "b" (make-node 3 "c" empty empty)
                                            (make-node 4 "d" empty empty))
                           (make-node 5 "e" empty empty)))

;; contains-key?: BT -> Bool
(define (contains-key? k t)
  (cond
    [(empty? t) false]
    [(= k (node-key t)) true]
    [else (or (contains-key? k (node-left t))
              (contains-key? k (node-right t)))]))


;; A Binary Search Tree (BST) is one of:
;; * empty
;; * A Node (make-node Nat Str BST BST)
;; Requires:
;; *Every key in left is less than key
;; *Every key in right is greater than key

;; bst-template: BST -> Any
;;(define (bst-template t)
;;  (cond
;;    [(empty? t) ...]
;;    [else ... (node-key t)...
;;          ... (node-val t)...
;;          ... (bst-template (node-left t))...
;;          ... (bst-template (node-right t)) ...]))

(define (count-values abst v)
  (cond [(empty? abst) 0]
        [else (+ (cond [(equal? v (node-val abst)) 1]
                       [else 0])
                 (count-values (node-left abst) v)
                 (count-values (node-right abst) v))]))

(define (increment t)
  (cond
    [(empty? t) empty]
    [else (make-node (add1 (node-key t))
                     (node-val t)
                     (increment (node-left t))
                     (increment (node-right t)))]))

(define (all-keys t)
  (cond
    [(empty? t) empty]
    [else
     (append (all-keys (node-left t))
             (list (node-key t))
             (all-keys (node-right t)))]))

;; Keys are in ascending order

;; bst-search: Nat BST -> (anyof Str False) <- key might not be in the value at all
(define (bst-search k t)
  (cond
    [(empty? t) false]
    [(= (node-key t) k) (node-val t)]
    [(> k (node-key t)) (bst-search k (node-right t))]
    [else (bst-search k (node-left t))]))

(define abst (make-node 5 "Tony" (make-node 1 "Qiang" empty empty)
                        (make-node 6 "Judy" empty (make-node 14 "Wole" empty empty))))

;; adding to a BST
;; bst-insert: (list Nat Str) BST -> BST
(define (bst-insert kv t)
  (cond
    [(empty? t) (make-node (first kv) (second kv) empty empty)]
    [(= (node-key t) (first kv))
     (make-node (node-key t)
                (second kv)
                (node-left t)
                (node-right t))]
    [(> (first kv) (node-key t))
     (make-node (node-key t)
                (node-val t)
                (node-left t)
                (bst-insert kv (node-right t)))]
    [else
     (make-node (node-key t)
                (node-val t)
                (bst-insert kv (node-left t))
                (node-right t))]))
;; al->bst: (listof (list Nat Str)) -> BST  
(define (al->bst al)
 (foldr bst-insert empty al)) ;; Builds the BST from the bottom (right) of the al to top


(define exampleal (list (list 4 "a")
                        (list 2 "b")
                        (list 29 "c")
                        (list 123 "d")
                        (list 0 "e")))