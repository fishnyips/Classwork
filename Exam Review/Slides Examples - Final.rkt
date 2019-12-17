;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Slides Examples - Final|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (first-points n a b)
  (build-list n (lambda (x) (+ (* a x) b))))

(define (count-starters phrases start)
  (length (filter (lambda (s) (equal? (substring (first phrases) 0 1) start)) phrases)))

;; Nested Structure
(define-struct doublefeature (first second start))

(define-struct movieinfo (director title length genre))

(define classic-movies
  (make-doublefeature
   (make-movieinfo "Welles" "Citizen Kane" 119 "Drama")
   (make-movieinfo "Kurosawa" "Rashoman" 88 "Mystery")
   20))

;; To get the name of the first movie in the double feature
(define (firstmoviename doublefeature)
  (movieinfo-title (doublefeature-first doublefeature)))

;; Servers
(define-struct server (name tips))

(define (bigtipslist alon smallest)
  (filter (lambda (tip) (<= smallest tip)) alon))

(define (bigtips s smallest)
  (make-server (server-name s) (bigtipslist (server-tips s) smallest)))

;; Binary Search Trees
(define-struct node (key val left right))
(define exampleabst (make-node 5 "Tony"
                               (make-node 1 "Qiang" empty empty)
                               (make-node 6 "Judy"
                                          empty
                                          (make-node 14 "Wole"
                                                     empty
                                                     empty))))

(define (countleaves abst v)
  (cond
    [(empty? abst) 0]
    [else
     (+ (cond
          [(equal? v (node-val abst)) 1]
          [else 0])
        (countleaves (node-left abst) v)
        (countleaves (node-right abst) v))]))

;; Incrementing Key + 1

(define (increment t)
  (cond
    [(empty? t) empty]
    [else
     (make-node (add1 (node-key t))
                (node-val t)
                (increment (node-left t))
                (increment (node-right t)))]))

;; All Keys of a BST
(define (allkeys t)
  (cond
    [(empty? t) empty]
    [else
     (append (allkeys (node-left t))
             (list (node-key t))
             (allkeys (node-right t)))]))

;; BST Insert
(define (addbst kv t)
  (cond
    [(empty? t) (make-node (first kv) (second kv) empty empty)]
    [(= (first kv) (node-key t))
     (make-node (node-key t) (second kv) (node-left t) (node-right))]
    [(< (first kv) (node-key t))
     (make-node (node-key t) (node-val t) (addbst kv (node-left t)) (node-right))]
    [else
     (make-node (node-key t) (node-val t) (node-left t) (addbst kv (node-right t)))]))
