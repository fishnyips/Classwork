;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname module2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Design Recipe - Module 2

;; Results in reliability and readability

;; Purpose: Describes what the function calculates. Role of the parameters should be clear
;; Contract: Includes the type of arguments the function consumes and the value it produces. Includes additional required conditions on the inputs if needed
;;    Mathematical notation that says what it consumes and what it produces
;;    What are the inputs (type) and what does it produce (Type)?
;; Extra constraints on the parameters
;; Requires 0 < a < b
;;    C must be nonzero
;; Examples: Shows the typical use of the program.
;; Definition: Racket code for the header and body of the function - implementation
;; Tests: Set of inputs and expected outputs used to build evidence that the function meets its requirements (special cases, boundaries)

;; Example - Sum of Squares (using (check-expect))

;; sum-of-squares produces the sum of the squares of two numbers a and b. (Purpose)
;; sum-of-squares: Num Num -> Num (Contract)

;; Examples
(check-expect (sum-of-squares 0 0) 0)
(check-expect (sum-of-squares 3 4) 25); will pump out a purple text (Tests passed!)

(define(sum-of-squares a b) ;Header
  (+ (* a a) (* b b)))      ;Definition is the entire function including the expressions

;; Tests
(check-expect (sum-of-squares -15 10) 325)
(check-expect (sum-of-squares 4/7 2/3) 340/441)
                           
;; Remainder is an operation on integers - Can't use this function on Pi

;; (sqrt-shift x c) produces the squareroot of (x - c)
;; sqrt-shift: Num Num ->
;; requires x >= c

(define (sqrt-shift x c)(- x c))

;; Sometimes restrictions are based on human knowledge and the semantics
;; (bump-grade g inc) produces g+inc, up to a maxmimum of 100
;; bump-grade: Num Num ->
;; requires: 0 <= g <= 100
;;           0 <= inc <= 10
(define (bump-grade g inc)
  (min (+ g inc) 100))

;; Writing examples: typical inputs and determine the answers by hand
;; 2 Examples are good
;; Should be chosen before you write the implementation
;; Do not have to cover all possibilities, we have tests for that

;;(check-within (circle-area 1) pi .00001) (check-within fun-application value-expected tol) - Tol for Tolerance




