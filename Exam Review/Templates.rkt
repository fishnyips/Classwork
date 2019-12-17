;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Templates) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; List Template
(define (loi-template aloi)
  (cond
    [(empty? aloi) ...]
    [else ... (first aloi) ... (loi-template (rest aloi))]))

;; Count Template
(define (count-apples aloi)
  (cond
    [(empty? aloi) 0]
    [(equal? (first aloi) "Apples") (+ 1 (count-apples (rest aloi)))]
    [else (count-apples (rest aloi))]))

;; Count to Base Template
(define (countupto n b)
  (cond
    [(> n b) (cons b empty)]
    [else (... n ... (countupto (add1 b)))]))

(define (countdownto n b)
  (cond
    [(= n b) (cons b empty)]
    [else (... n (countdownto (sub1 n) b))]))

;; Insert and Sort
(define (my-sort alon)
  (cond
    [(empty? alon) empty]
    [else (insert (first alon) (rest alon))]))

(define (insert n alon)
  (cond
    [(empty? alon) n]
    [(< n (first alon)) (cons n (rest alon))]
    [else (cons (first alon) (insert n (rest alon)))]))

;; Looking things up in a dictionary
(define (lookup-al k alst)
  (cond
    [(empty? alst) false]
    [(equal? k (first (first alst)))(second (first alst))]
    [else (lookup-al k (rest alst))]))

;; Alongforride template
(define (alongforride list1 list2)
  (cond
    [(empty? list1) list2]
    [else (... (first list1) ... (alongforride (rest list1) list2))]))

;; Lockstep template
(define (locksteptemplate list1 list2)
  (cond
    [(empty? list1) ...]
    [else (... (first list1) ... (first list2)... (locksteptemplate (rest list1) (rest list2)))]))

;; Different rates template
(define (differenttemplate list1 list2)
  (cond
    [(and (empty? list1) (empty? list2))...]
    [(and (empty? list1) (cons? list2)) ...
     ... (first list2) ... (differenttemplate list1 (rest list2))]
    [(and (cons? list1) (empty? list2))
     ... (first list1) ... (differenttemplate (rest list1) (list2))]
    [(and (cons? list1) (cons? list2))
     (... (first list1) ... (differenttemplate (rest list1) (list2))) ;; Recurse using list 1
     (... (first list2) ... (differenttemplate list1 (rest list2))) ;; Recurse using list 2
     (... (first list1) ... (first list2) ... (differenttemplate (rest list1) (rest list2)))])) ;; Recurse both

;; Merge List
(define (mergelist list1 list2)
  (cond
    [(and (empty? list1) (empty? list2)) empty]
    [(and (empty? list1) (cons? list2)) list2]
    [(and (cons? list1) (empty? list2)) list1]
    [(< (first list1) (first list2)) (cons (first list1) (mergelist (rest list1) list2))]
    [else (cons (first list2) (mergelist list1 (rest list2)))]))

;; Consuming a List and a Nat
(define (listandnat n lst)
  (cond
    [(and (= n 0) (empty? lst)) ...]
    [(and (= n 0) (cons? lst)) (cons (first lst) (listandnat n (rest lst)))]
    [(and (> n 0) (empty? lst)) (... (listandnat (sub1 n) lst))]
    [(and (> n 0) (cons? lst)) (cons (first lst) (listandnat (sub1 n) (rest lst)))]))

(define (at-least? n elem lst)
  (cond
    [(= n 0) true]
    [else
     (cond
       [(empty? lst) false]
       [(equal? (first lst) elem)
        (at-least? (sub1 n) elem (rest lst))]
       [else (at-least n elem (rest lst))])]))

;; Local Function Example
(define (multiplesof n alist)
  (local
    [(define (is-mult? m)
       (zero? (remainder m n)))]
    (filter is-mult? alist)))

;; Structures
(define-struct cardstructure (field1 field2 field3)) ;; Making the structure
(make-cardstructure1 (field1 field2 field3)) ;; Constructor
(define field1 cardstructure-field1) ;; Selector
(define cardpredicate cardstructure?) ;; Predicate

;;  Structure General Template
(define-struct movieinfo (title director length))
(make-movieinfo ("Harry Potter" "Rowling" 120))
(define (movie-template info)
  (... (movieinfo-title info)...
       (movieinfo-director info)...
       (movieinfo-length info)))
;; Mixed Data Template
(define (streamingvideo info)
  (cond
    [(movieinfo? info) ...]
    [else ... ]))
;; To Change Something in a Structure
(define (correct-length info)
  (make-movieinfo (movieinfo-title "Harry Potter")
                  (movieinfo-director "Rowling")
                  (movieinfo-length 119)))

;; Binary Arithmetic Expressions
(define-struct binode (op arg1 arg2))

(define (binexptemplate ex)
  (cond
    [(number? ex) ... ex...]
    [else
     (cond
       [(equal? (binode-op ex) '+) (+ (binode-arg1 ex) (binode-arg2 ex))]
       [(equal? (binode-op ex) '-) (- (binode-arg1 ex) (binode-arg2 ex))]
       [else (/ (binode-arg1 ex) (binode-arg2 ex))])]))

;; Binary Tree
(define-struct node (key val left right))
(define (binarytree t)
  (cond
    [(empty? t) ... ]
    [else
     (cond
       [(... (node-key t) ...)
        (... (node-val t) ...)
        (binarytree (node-left t) ...)
        (binarytree (node-right t) ...)])]))

(define (countleaves t)
  (cond
    [(empty? t) 0]
    [else
     [(and (empty? (node-left t)) (empty? (node-right t))) 0]
     [else (+ (countleaves (node-left t))
              (countleaves (node-right t)))]]))

       
