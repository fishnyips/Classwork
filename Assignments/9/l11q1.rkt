;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname l11q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Lab Question 4

(define-struct game (winner loser high low))
(define-struct game-result (winner loser high low))

    (define (games-won results name)
          (length (filter
          (lambda (game) (equal? ( game-winner game) name)   )
      results
     )
  )   
)

(check-expect (games-won (list (make-game "Lori" "Troy" 52 34)) "Lori") 1 )