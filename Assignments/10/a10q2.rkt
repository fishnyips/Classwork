;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a10q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 10, Question 2
;; **********************

(define-struct fnode (key val left right))
;; An FNode is a (make-fnode Str (listof Str) FBST FBST)

;; A Follower Binary Search Tree (FBST) is one of:
;; * empty
;; * (make-fnode Str (listof Str) FBST FBST)
;; Where:
;; * every key in left is less than key (using string<?)
;; * every key in right is greater than key

;; (calc-followers los) produces a FBST after consuming a los
;; * every string in los should appear as a key exactly once in the FBST
;; * value associated with the key should be a list of the strings in los
;; * that occur immediately after each occurence of that kye
;; * last string in the list will be the key at the root of the tree
;; * val field must not contain any duplicates
;; (listof Str) -> FBST

;; Examples:
(check-expect (calc-followers empty) empty)
(check-expect (calc-followers (list "Hi"))
              (make-fnode "Hi" empty empty empty))
(check-expect (calc-followers (list "a" "a" "a" "a" "a"))
              (make-fnode "a" (list "a") empty empty))
(check-expect (calc-followers (list "b" "a" "d"))
              (make-fnode "d" empty
                          (make-fnode "a" (list "d")
                                      empty
                                      (make-fnode "b" (list "a")
                                                  empty
                                                  empty))
                          empty))
(check-expect (calc-followers (list "m" "z" "m" "z" "a" "m"))
              (make-fnode "m" (list "z")
                          (make-fnode "a" (list "m") empty empty)
                          (make-fnode "z" (list "a" "m")
                                      empty empty))) 

(define (calc-followers los)
  (cond
    ((empty? los) empty)
    ((equal? (length los) 1)
     (calc-followers-help los (make-fnode(first los) empty empty empty)))
    (else (calc-followers-help los
           (make-fnode(first los) (list (first (rest los))) empty empty)))))

(define (calc-followers-help los subtree)
  (cond 
    ((empty? los) subtree)
    ((string=? (first los) (fnode-key subtree))
     (calc-followers-help (rest los) subtree))
    ((and (equal? (length los) 1)
          (string<? (first los) (fnode-key subtree)))
     (calc-followers-help (rest los) (make-fnode (first los) empty empty subtree)))
    ((equal? (length los) 1)
     (calc-followers-help (rest los) (make-fnode (first los) empty subtree empty)))
    ((string<? (first los)
               (fnode-key subtree)) (calc-followers-help (rest los) (make-fnode (first los) (list (first (rest los))) empty subtree)))
    (else (calc-followers-help (rest los) (make-fnode (first los) (list (first (rest los))) subtree empty)))))