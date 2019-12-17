;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 03, Question 2
;; **********************

;; (inc-dec?) produces a boolean value if n1 n2 n3 n4 are either increasing or decreasing 
(define (inc-dec? n1 n2 n3 n4)
  (or(< n1 n2 n3 n4) (> n1 n2 n3 n4)))

;; (uniform?) produces a boolean value if n1 n2 n3 n4 are uniform parity
(define (uniform? n1 n2 n3 n4)
  (and
   (= (remainder n1 2) (remainder n3 2))
   (= (remainder n2 2) (remainder n4 2))
   (equal? (remainder n1 2) (remainder n3 2))))

;; (alt?) produces a boolean value if n1 n2 n3 n4 are alternating parity
(define (alt? n1 n2 n3 n4)
  (and
   (= (remainder n1 2) (remainder n3 2))
   (= (remainder n2 2) (remainder n4 2))
   (or (< (remainder n1 2) (remainder n2 2))
       (> (remainder n1 2) (remainder n2 2)))))

;; (alt-uniform?) produces a boolean value if n1 n2 n3 n4 are either alternate parity
;; or uniform parity

(define (alt-uniform? n1 n2 n3 n4)
  (or
   (uniform? n1 n2 n3 n4)
   (alt? n1 n2 n3 n4)))


;; (strict-parity-seq?) produces a boolean value if the sequence n1 n2 n3 n4 is
;; strictly increasing or strictly decreasing, and the sequence has either alternating
;; parity or uniform parity
;; strict-parity-seq?: Nat Nat Nat Nat -> Bool

;; Examples:
(check-expect(strict-parity-seq? 1 2 3 4)true)
(check-expect(strict-parity-seq? 4 2 1 3)false)
(check-expect(strict-parity-seq? -1 -5 -9 -13)true)
(check-expect(strict-parity-seq? 1 1 1 1)false)
(check-expect(strict-parity-seq? 4 2 -1 0)false)

(define (strict-parity-seq? n1 n2 n3 n4)
  (and
   (inc-dec? n1 n2 n3 n4)
   (alt-uniform? n1 n2 n3 n4)))

;; Tests:
(check-expect(strict-parity-seq? 0 0 0 0)false)
(check-expect(strict-parity-seq? 1 0 1 0)false)