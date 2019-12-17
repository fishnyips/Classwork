;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Lab 11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Lab 11

;; Question 1
(define-struct game (winner loser high low))

(define (fixed-game a-game)
  (make-game (game-winner a-game) (game-loser a-game)
             (+ (game-high a-game) (game-low a-game)) 0))

;; Question 2
(define-struct card (rank suit))
(define (cardsuitrank card)
  (cond
    [(equal? (card-suit card) 'spades) 4]
    [(equal? (card-suit card) 'hearts) 3]
    [(equal? (card-suit card) 'clubs) 2]
    [(equal? (card-suit card) 'diamonds) 1]))


(define (big-card-small-suit card1 card2)
  (make-card (max (card-rank card1) (card-rank card2))
             (cond
               [(equal? (card-suit card1) (card-suit card2)) (card-suit card1)]
               [else
                (min (cardsuitrank card1) (cardsuitrank card2))])))