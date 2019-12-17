;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a06q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 6, Question 3
;; **********************

;; A DataTypeDictionary is an association list, where
;;   * the keys are one of "Num", "Str", "Char", or "Bool", and
;;   * the associated values are lists, where the types of
;;     the elements match the type indicated by the key.
;;     There are no duplicate values in these lists.

;; An Action is a (list (anyof "add" "remove") (anyof Num Str Char Bool))
;; where,
;;   * the first element of the list represents an instruction
;;   * the second element of the list is a value either
;;     being added or removed from a dictionary.

;;(insert-bool data item action) produces an updated dictionary after consuming
;; a specific Action and item
;; insert-bool: DataTypeDictionary Str Str -> DataTypeDictionary

(define (insert-bool data item action)
  (cond
    ((and (empty? data) (equal? action "add")) (append empty (list(list "Bool" (list item)))))
    ((not (member? "Bool" (first data))) (cons (first data) (insert-bool (rest data) item action)))
    ((equal? action "add")
     (cond
       ((not (member? data (second (first data)))) (cons (list "Bool" (append (second (first data)) (list item))) (rest data)))))
    (else (cons (list "Bool" (remove item (second (first data)))) (rest data))))) 

;;(insert-num data item action) produces an updated dictionary after consuming
;; a specific Action and item
;; insert-num: DataTypeDictionary Str Str -> DataTypeDictionary
(define (insert-num data item action) 
  (cond
    ((and (empty? data) (equal? action "add")) (append empty (list(list "Num" (list item)))))
    ((not (member? "Num" (first data))) (cons (first data) (insert-num (rest data) item action)))
    ((equal? action "add")
     (cond
       ((not (member? data (second (first data)))) (cons (list "Num" (append (second (first data)) (list item))) (rest data)))))
    (else (cons (list "Num" (remove item (second (first data)))) (rest data))))) 

;;(insert-char data item action) produces an updated dictionary after consuming
;; a specific Action and item
;; insert-char: DataTypeDictionary Str Str -> DataTypeDictionary
(define (insert-char data item action) 
  (cond
    ((and (empty? data) (equal? action "add")) (append empty (list(list "Char" (list item)))))
    ((not (member? "Char" (first data))) (cons (first data) (insert-char (rest data) item action)))
    ((equal? action "add")
     (cond
       ((not (member? data (second (first data)))) (cons (list "Char" (append (second (first data)) (list item))) (rest data)))))
    (else (cons (list "Char" (remove item (second (first data)))) (rest data))))) 

;;(insert-str data item action) produces an updated dictionary after consuming
;; a specific Action and item
;; insert-str: DataTypeDictionary Str Str -> DataTypeDictionary
(define (insert-str data item action)
  (cond
    ((and (empty? data) (equal? action "add")) (append empty (list(list "Str" (list item)))))
    ((not (member? "Str" (first data))) (cons (first data) (insert-str (rest data) item action)))
    ((equal? action "add")
     (cond
       ((not (member? data (second (first data)))) (cons (list "Str" (append (second (first data)) (list item))) (rest data)))))
    (else (cons (list "Str" (remove item (second (first data)))) (rest data)))))

(define (update-helper data action item)
  (cond
    ((char? item) (insert-char data item action))
    ((number? item) (insert-num data item action))
    ((string? item) (insert-str data item action))
    (else (insert-bool data item action))))

(define start (list (list "Num" (list 5 1.3 -1))
 (list "Bool" empty)
 (list "Char" (list #\p))
 (list "Str"
 (list "cs" "CS" "Computer Science")))) 

;; (update data act) produces a revised list consuming data and act
;; update: (listof Any) Str -> (listof Any)

;; Examples:
(check-expect (update start (list "add" true))
(list (list "Num" (list 5 1.3 -1))
 (list "Bool" (list true))
 (list "Char" (list #\p))
 (list "Str" (list "cs" "CS" "Computer Science"))))

(check-expect (update start (list "remove" "CS"))
(list (list "Num" (list 5 1.3 -1))
 (list "Bool" empty)
 (list "Char" (list #\p))
 (list "Str" (list "cs" "Computer Science"))))

(check-expect (update start (list "remove" #\p))
(list (list "Num" (list 5 1.3 -1))
 (list "Bool" empty)
 (list "Char" empty)
 (list "Str" (list "cs" "CS" "Computer Science"))))

(check-expect (update empty (list "add" 1)) (list (list "Num" (list 1))))

;; Tests:
(define (update data act)
  (update-helper data (first act) (second act)))

(check-expect (update start (list "add" false))
(list (list "Num" (list 5 1.3 -1))
 (list "Bool" (list false))
 (list "Char" (list #\p))
 (list "Str" (list "cs" "CS" "Computer Science"))))

