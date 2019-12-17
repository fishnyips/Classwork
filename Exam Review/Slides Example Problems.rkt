;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Slides Example Problems|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (count-apples alos)
  (cond
    [(empty? alos) 0]
    [(not (equal? (first alos) "apple")) 0]
    [else (+ 1 (count-apples (rest alos)))]))

(define (negate-list aloi)
  (cond
    [(empty? aloi) empty]
    [else (cons (- (first aloi)) (negate-list (rest aloi)))]))

(define (my-remove-all alon n)
  (cond
    [(empty? alon) empty]
    [(equal? (first alon) n) (rest alon)]
    [else (cons (first alon) (my-remove-all (rest alon) n))]))

;; Canadianize
(define (canadianize s)
  (list->string (canadianizer (string->list s))))

(define (canadianizer loc)
  (cond
    [(empty? loc) empty]
    [(equal? (first loc) #\o) (cons (first loc) (cons #\u (rest loc)))]
    [else (cons (first loc) (canadianizer (rest loc)))]))

;; Portions - Crystal help
;; (define (portions lon))

;; max-list
(define (max-list lon)
  (cond
    [(empty? lon) empty]
    [(empty? (rest lon)) (first lon)]
    [else (max (first lon) (max-list (rest lon)))]))

;; count-down
(define (count-down n)
  (cond
    [(zero? n) (cons 0 empty)]
    [else (cons n (count-down (sub1 n)))]))
;; count-down to b
(define (count-downtob n b)
  (cond
    [(= n b)(cons b empty)]
    [else (cons n (count-downtob (sub1 n) b))]))

;; count-up to b
(define (count-up n b)
  (cond
    [(>= n b)(cons b empty)]
    [else (cons n (count-up (add1 n) b))]))