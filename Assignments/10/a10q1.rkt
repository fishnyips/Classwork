;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a10q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 10, Question 1
;; **********************

(define-struct pnode (op arg1 arg2))
;; A Polynomial Expression Node (PNode) is a
;; (make-pnode (anyof '+ '- '*) PExp PExp)

;; A Polynomial expression (PExp) is one of:
;; * A Num
;; * 'x
;; * A PNode

;; (eval/x ex val) produces a result of an expression Num which
;; consumes ex and val which represents the current value of x
;; PExp Num -> Num

;; Examples:
(check-expect (eval/x (make-pnode '+ 11 12) 159) 23)
(check-expect (eval/x 'x 66) 66)
(check-expect (eval/x (make-pnode '+ (make-pnode '* 'x -7) 3) -2) 17)
(check-expect (eval/x (make-pnode '* 'x (make-pnode '+ 'x 1)) 5) 30)

(define (eval/x ex val)
  (cond
    ((number? ex) ex)
    ((equal? ex 'x) val)
    ((equal? (pnode-op ex) '+)
     (+ (eval/x (pnode-arg1 ex) val)(eval/x (pnode-arg2 ex) val)))
    ((equal? (pnode-op ex) '-)
     (- (eval/x (pnode-arg1 ex) val)(eval/x (pnode-arg2 ex) val)))
    (else (* (eval/x (pnode-arg1 ex) val)(eval/x (pnode-arg2 ex) val)))))

;; Tests:
(check-expect (eval/x (make-pnode '+ 25 12) 0) 37)
(check-expect (eval/x (make-pnode '+ (make-pnode '* 'x -7) 3) 0) 3)
(check-expect (eval/x (make-pnode '- (make-pnode '* 'x -7) 3) -1) 4)
(check-expect (eval/x 'x -66) -66)
(check-expect (eval/x 'x 0) 0)

;; (poly->exp p) produces a PExp that can be used to
;; evaluate which consumes a polynomial p
;; (listof Num) -> PExp

;; Examples:
(check-expect (poly->exp empty) 0)
(check-expect (poly->exp (list 4 2))
              (make-pnode '+ 4 (make-pnode '* 'x 2)))
(check-expect (poly->exp (list 3 0 1))
              (make-pnode
               '+
               3
               (make-pnode
                '*
                'x
                (make-pnode '* 'x 1))))

(define (poly->exp p)
  (poly-help->exp p '+)
  )

(define (poly-help->exp p sign)
  (cond
    ((empty? p) 0)
    ((and (equal? (first p) 0) (equal? sign '+)) (poly-help->exp (rest p) '*))
    ((and (equal? (length p) 1) (equal? sign '+)) (first p))
    ((equal? (length p) 1) (make-pnode sign 'x (first p)))
    ((equal? sign '+) (make-pnode sign (first p) (poly-help->exp (rest p) '*)))
    (else (make-pnode sign 'x (poly-help->exp p '+)))))

;; Tests
;; p(x) = 41 + x + x^2
(define test1 (poly->exp (list 41 1 1)))
(define test2 (poly->exp (list 40 1 1)))
;; Test p(0), p(1), p(2), p(3), and p(4) together
(check-expect (map (lambda (x) (eval/x test1 x))
                   (list 0 1 2 3 4))
              (list 41 43 47 53 61))
(check-expect (map (lambda (x) (eval/x test2 x))
                   (list 0 1 2 3 4))
              (list 40 42 46 52 60))

