;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l03q6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 03, Question 6
;; **********************

;; (length-cost) produces the cost of editing a film in using m minutes
;; length-cost Nat -> Nat
(define (length-cost m)
  (* 150 m))

;; (clips-cost) produces the cost of editing c number of clips
;; if the number of clips exceeds bp, disc is applied to the cost of editing
;; clips-cost: Nat Nat Num -> Num
;; requires: 0 <= disc <= 1

;; Examples
(check-expect(clips-cost 5 3 0.25)450)
(check-expect(clips-cost 5 10 0.5)500)

(define (clips-cost c bp disc)
  (+ (* (min c bp) 100)(* (max (- c bp) 0) 100 (- 1 disc))))

;; Tests:
(check-expect(clips-cost 0 0 0)0)
(check-expect(clips-cost 5 5 1)500)
(check-expect(clips-cost 5 10 1)500)
(check-expect(clips-cost 5 3 0)500)

;; (clips-costx) produces the total cost of editing a film with company 1 based
;; on the m length of the film, c number of clips, bp1 breakpoints and disc1 company 1 discount
(define (clips-costx m c bp1 disc1)
  (+ (* (min c bp1) 100)(* (max (- c bp1) 0) 100 (- 1 disc1))
  (length-cost m)))

;; (clips-costy) produces the total cost of editing a film with company 2 based
;; on the m length of the film, c number of clips, bp2 breakpoints and disc2 company 2 discount
(define (clips-costy m c bp2 disc2)
  (+ (* (min c bp2) 100)(* (max (- c bp2) 0) 100 (- 1 disc2))
  (length-cost m)))

;; (film-choice) produces a sentence with the total cost of editing a film with company 1 
;; and company 2 based on common inputs m and c, as well as specific company 1 bp1 breakpoint
;; and discount disc1 and company 2 breakpoint bp2 and discount disc2
;; film-choice: Nat Nat Nat Nat Num Num -> Str

;; Examples:
(check-expect(film-choice 30 10 5 8 0.25 0.5) "Cost for option 1 is 5375 and cost for option 2 is 5400")

(define (film-choice m c bp1 bp2 disc1 disc2)
  (string-append "Cost for option 1 is "
                 (number->string (clips-costx m c bp1 disc1))
                 " and cost for option 2 is "
                 (number->string (clips-costy m c bp2 disc2))))

;; Tests:
(check-expect(film-choice 0 0 0 0 0 0) "Cost for option 1 is 0 and cost for option 2 is 0")

