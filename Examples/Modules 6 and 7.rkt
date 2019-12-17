;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Modules 6 and 7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (my-map f alist)
  (cond
    [(empty? alist) empty]
    [else (cons (f (first alist)) (my-map f (rest alist)))]))

;; Map will apply a function to the things in a list, and produce a new adjusted list
;; (foldr f b (list x1 x2 x3 ... xn))
;; start with b, and you take the last thing of the list and do (f xn b) (alpha1)
;; (f xn-1 (alpha1)) = (alpha2) -> recursion


(define (build-helper k n f)
  (cond
    [(= n k) empty]
    [else (cons (f k) (build-helper (add1 k) n f))]))

;; first-evens: Nat -> (listof Nat)
(define (my-build-list n f) (build-helper 0 n f))

(define (double x) (* x 2))

;; Start of Class Notes

;;(define (compare a b) (< a b)) ; Only need to change the operator in this case, adds flexibility

;; Functions are values in intermediate student

;;(define (insert elt lst compare)
  ;;(cond
    ;;[(empty? lst) (cons elt empty)]
    ;;[(compare elt (first lst)) (cons elt lst)]
    ;;[else (cons (first lst) (insert elt (rest lst) compare))]))

;;(define (my-sort lst compare)
  ;;(cond
    ;;[(empty? lst) empty]
    ;;[else (insert (first lst) (my-sort (rest lst) compare) compare)]))

(define (not-apple? val) (not (symbol=? val 'apple)))

(define (my-filter alist pred?)
  (cond
    [(empty? alist) empty]
    [(pred? (first alist))
     (cons (first alist) (my-filter (rest alist) pred?))]
    [else (my-filter (rest alist) pred?)]))

(define (select-even alist)
  (cond
    [(empty? alist) empty]
    [(even? (first alist))
     (cons (first alist) (select-even (rest alist)))]
    [else (select-even (rest alist))]))

(map string-length (list "abc" "adeg" "rewqoiuewq" "dsalkjewq"))

(define (combine-nonempty s t)
  (cond
    [(string=? "" s) t]
    [else (string-append (substring s 0 1) t)]))

(define (concat-firsts alist)
  (foldr combine-nonempty "" alist))

;; concat-first: Str Str -> Str
;; requires: s is not an empty string
(define (concat-first s wrd)
  (cond
    [(zero? (string-length s)) wrd]
    [else (string-append (substring s 0 1) wrd)]))

(define (initialism los) (foldr concat-first "" los))

;; if you want to produce a list using foldr, your helper function requires a foldr
(define (negate-combine element recursive-result)
  (cons (- element) recursive-result))

(define (negate-list lon) (foldr negate-combine empty lon))

;; andmap - is everything in this list even? -> kind of like an all? predicate
;; (andmap p alist) - produces true if everything is true with the predicate
;; ormap - any? predicate, does ANYTHING in this list match the predicate?

(define (all? pred? lst)
  (not (member? false (map pred? lst))))

(define (all2? pred2? lst2)
  (= (length lst2) (length (filter pred2? lst2))))

(foldr cons empty (list 1 2 3 4))

;; Filter can only take a function that consumes one argument, one way to get around this
;; is by using the local function and defining the term within the function

(define (multiples2-of n lon)
  (local
    [(define (is-mult? k)
       (zero? (remainder k n)))]
  (filter is-mult? lon)))

;; running is-mult? on it's own will not work because it only exists within the multiples2-of function (encapsulated)
;; check-expect also doesn't work in the local, therefore you don't need to write examples or tests. Just test the main function
;; that tests these local functions within

;; Recursion
(define (multiples-of n lon)
  (cond
  [(empty? lon) empty]
  [(zero? (remainder (first lon) n))
   (cons (first lon)
         (multiples-of n (rest lon)))]
  [else (multiples-of n (rest lon))]))

;; Use the Racket Check Syntax to see where the linkages are

;; Using local functions for the recursive call
(define (eat-apples los)
  (cond
    [(empty? los) empty]
    [else
  (local
    [(define ate-rest (eat-apples (rest los)))]
    (cond
      [(symbol=? (first los) 'apple) ate-rest]
      [else (cons (first los) ate-rest)]))]))

;; This takes too much memory and time
;;(define (max-list lon)
  ;;(cond
    ;;[(empty? (rest lon)) (first lon)]
    ;;[(> (first lon) (max-list (rest lon))) (first lon)]
    ;;[else (max-list (rest lon))]))

;; This is much faster, and uses the local function to be faster
(define (max-list lon)
  (cond
    [(empty? (rest lon)) (first lon)]
    [else
     (local
       [(define max-rest (max-list (rest lon)))]
       (cond
    [(> (first lon) max-rest) (first lon)]
    [else max-rest]))]))

;; A Point is a (list Num Num)

(define (point-x P) (first P))
(define (point-y P) (second P))

(define (distance P Q)
  (local
    [(define dx (- (point-x P) (point-x Q)))
     (define dy (- (point-y P) (point-y Q)))]
  (sqrt (+ (sqr dx) (sqr dy)))))

(define (my-sort lon)
  (local
    [(define (insert n lon)
  (cond
    [(empty? lon) (cons n empty)]
    [(<= n (first lon)) (cons n lon)]
    [else (cons (first lon) (insert n (rest lon)))]))]
  (foldr insert empty lon)))

(define (shorter-than-avg slist)
  (local
    [(define lengths (map string-length slist))
     (define avg (/ (foldr + 0 lengths) (length lengths)))
     ;; (short? s) checks if a string s has length less than avg
     ;; short?: Str -> Bool
     (define (short? s)
       (< (string-length s) avg))]
    (filter short? slist)))

;; lambda - local define

;; Calculation of pi infinite series
(define (calc-pi n)
  (* 4 (foldr + 0 (build-list n (lambda (i) (/ (expt -1 i) (add1 (* 2 i))))))))




