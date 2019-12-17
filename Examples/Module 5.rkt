;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Module 5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Natural Number
;; * 0
;; * (add1 Nat)

(define (countdown n)
  (cond
    (( <= n 0) (cons 0 empty))
    (else (cons n (countdown(sub1 n))))))

;; countup-to:

(define (countup-to n base)
  (cond
    ((= n base) (cons base empty))
    (else (cons n (countup-to (add1 n) base)))))


;;(define (nat-template n)
;;  (cond
;;    ((zero? n) ...)
;;    (else ... n ... (nat-template (sub1 n)) ... )))

;; Factorial
;; 0! = 1
;; n! = n x (n-1)!

(define (factorial n)
  (cond
    ((zero? n) 1)
    (else (* n (factorial (sub1 n))))))

;; contains?: Any (listof Any) -> Any
(define (contains? info alist)
  (cond
    ((empty? alist)false)
    ((equal? (first alist) info) true)
    (else (contains? info (rest alist)))))

;; (negate-list alon) produces a list formed by negating
;; each item in alon
;; negate-list: (listof Num) -> (listof Num)

;; Examples:
;(check-expect(negate-list empty) empty)
;(check-expect(negate-list (cons 2 (cons -12 empty)))(cons -2 (cons 12 empty)))

(define (negate-list lon)
  (cond
    ((empty? lon) empty)
    (else (cons (- (first lon))(negate-list (rest lon)))))); depending on what you apply to every element, just put it in front of the (first lon)

;; Removing elements from a list
;; (my-remove-all n alon) produces list with all occurences of n
;; removed from alon.
;;removal: Num (listof Num) -> (listof Num)

(define (my-remove-all n alon)
  (cond
    ((empty? alon) empty)
    ((= n (first alon)) (my-remove-all n (rest alon)))
    (else (cons (first alon) (my-remove-all n (rest alon))))))

;; Remove duplicates
(define (singles alon)
  (cond
    [(empty? alon) empty]
    (else (cons (first alon) (my-remove-all (first alon) (singles (rest alon)))))))

;; Wrapper Function

;;(string->list) ; turns a string into a list of its characters
;;(list->string) ; list of characters into string
;;(list->string (process-string(string->list "literally anything")))

;;Example of Wrapped Helper Function
;; listof-char-template (listof Char) -> (listof Char)

(define (discard-spaces loc)
  (cond
    ((empty? loc) empty)
    ((char=? (first loc) #\space)(discard-spaces(rest loc)))
    (else (cons (first loc) (discard-spaces (rest loc))))))
;; Example of Wrapper Function
;; string-template: Str -> Str
(define (string-template s)
  (list->string (discard-spaces (string->list s)))) ; Example of using the Wrapper Function

;;Canadianizing a string
;;(canadianize s) produces a string in which each o in s
;; is replaced by ou.
;; canadianize: Str -> Str
;; Examples:


;; portions produces a list of fractions of the total represented by each number in a list

;; problem because total-list changes

(define (total-list lon)
  (cond
    ((empty? lon) 0)
    (else (+ (first lon) (total-list (rest lon))))))

(define (portions/total lst total)
  (cond
    ((empty? lst) empty)
    (else (cons (/ (first lst) total) (portions/total (rest lst) total)))))

(define (portions lst)
  (portions/total lst (total-list lst)))

;; If a function requires that a parameter is a nonempty list, we add a requires section
;; A nonempty list of numbers (Neln) is either:
;; * (cons Num empty)
;; * (cons Num Neln)

(define (max-list lon)
  (cond
    [(empty? (rest lon))(first lon)]
    [else (max (first lon) (max-list (rest lon)))]))
     
    
     

