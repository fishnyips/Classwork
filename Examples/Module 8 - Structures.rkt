;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Module 8 - Structures|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Fixed-length lists
;; Group together related pieces of information together into a fixed length list

;; A structure is a way of bundling several pieces of data together to form a single package
;; Create functions that consume or produce structures
;; Define our own structures, getting free functions that create structures and functions that extract
;; data from structures

;; A Card is a
;; (make-card Nat (anyof ’hearts ’diamonds ’spades ’clubs))
;; requires
;; rank is between 1 and 13, inclusive

(define-struct card (rank suit))

(define h5(make-card 5 'hearts))

(card? h5) ; type predicate function

;; Once the structure card has been defined, the functions make-card, card-rank, card-suit, card?
;; are created by Racket, do not have to write them ourselves

;; (pair? c1 c2) produces true if c1 and c2 have the same rank,
;; and false otherwise
;; pair?: Card Card -> Bool
(define (pair? c1 c2)
  (= (card-rank c1) (card-rank c2)))

;; (one-better c) produces a Card, with the same suit as c, but
;; rank is one more than c (to a maximum of 13)
;; one-better: Card -> Card
(define (one-better c)
  (make-card (min 13 (+ 1 (card-rank c))) (card-suit c)))

;; A Posn is a built-in structure that has two fields containing numbers inteded to represent x and y coords
;; A Posn is a (make-posn Num Num)
;; make-posn: Num Num -> Posn
;; posn-x: Posn -> Num
;; posn-y: Posn -> Num
;; posn?: Any -> Bool

(define myposn (make-posn 8 1))

;; (distance posn1 posn2) produces the Euclidean distance
;; between posn1 and posn2
;; distance: Posn Posn -> Num
(define (distance posn1 posn2)
  (sqrt (+ (sqr (- (posn-x posn1)(posn-x posn2)))
           (sqr (- (posn-y posn1)(posn-y posn2))))))

;; (scale point factor) produces the Posn that results when the fields of point are multiplied by factor
;; scale: Posn Num -> Posn
(define (scale point factor)
  (make-posn (* factor (posn-x point))
             (* factor (posn-y point))))

;; Structure definition: code defining a structure, and resulting in a constructor
;; selector, and type predicate functions

;; (define-struct sname (field1 field2 field3))
;; Constructor: make-sname
;; Selectors: sname-field1, sname-field2, sname-field3
;; Predicate: sname?

;; Structure for Movie Information, we want to represent information associated with movies
(define-struct movieinfo (director title duration genre))
;; A MovieInfo is a (make-movieinfo Str Str Nat Str)
;; where:
;;  director is the name of director of the movie,
;;  title is the name of movie,
;;  duration is the length of the movie in minutes,
;;  genre is the genre (type or category) of the movie

;; Constructor: make-movieinfo
;; Selectors: movieinfo-director, movieinfo-title, movieinfo-duration, movieinfo-genre
;; Predicate movieinfo?

(define et-movie
  (make-movieinfo "Spielberg" "ET" 115 "Sci-Fi"))

;; (correct-genre oldinfo newg) produces a new MovieInfo
;; formed from oldinfo, correcting genre to newg
;; correct-genre: MovieInfo Str -> MovieInfo

(define (correct-genre oldinfo newg)
  (make-movieinfo (movieinfo-director oldinfo)
                  (movieinfo-title oldinfo)
                  (movieinfo-duration oldinfo)
                  newg))

(define-struct tvseries (title eps len-per))
;; A TVSeries is a (make-tvseries Str Nat Nat)
;; where
;; title is the name of the series
;; eps is the total number of episodes
;; len-per is the average length (in minutes) for one episode

(define murdoch (make-tvseries "Murdoch Mysteries" 168 42))
(define friends (make-tvseries "Friends" 236 22))
(define fawlty (make-tvseries "Fawlty Towers" 12 30))

;; tvseries-template: TVSeries -> Any
;;(define (tvseries-template series)
;;  (... (tvseries-title series)...
;;       ... (tvseries-eps series)...
;;       ... (tvseries-len-per series)...))

(define (total-length series)
  (* (tvseries-eps series) (tvseries-len-per series)))

;; A StreamingVideo is one of:
;; * a MovieInfo or
;; * a TVSeries

;; streamingvideo-template: StreamingVideo -> Any
(define (streamingvideo-template info)
  (cond
    [(movieinfo? info) ... ]
    [else ...]))

(define (streamingvideo-title info)
  (cond
    [(movieinfo? info) (movieinfo-title info)]
    [else (tvseries-title info)]))

(define-struct doublefeature (first second start-hour))
;; A DoubleFeature is a
;; (make-doublefeature MovieInfo MovieInfo Nat)
;; requires:
;; start-hour is between 0 and 23, inclusive

(define classic-movies
  (make-doublefeature
   (make-movieinfo "Welles" "Citizen Kane" 119 "Drama")
   (make-movieinfo "Kurosawa" "Rashoman" 88 "Mystery") 20))

(define-struct server (name tips))
;; A Server is a (make-server Str (listof Num)
;; requires:
;; numbers in tips are non-negative

;;(define (big-tip-list alon smallest)
;;  (filter (lambda (tip) (<= smallest tip)) alon))

;;(define (big-tip s smallest)
;;  (make-server (server-name s) (big-tip-list (server-tips s) smallest)))

(define-struct student (name assts mid final))
;; A Student is a (make-student Str Num Num Num)
;; requires:
;; assts, mid, final are between 0 and 100
;; A (listof Student) is one of:
;; *empty
;; *(cons Student (litsof Student))

(define myslist
  (cons (make-student "Virginia Woolf" 100 100 100)
        (cons (make-student "Alan Turing" 90 80 40)
              (cons (make-student "Anonymous" 30 55 10) empty))))

(define vw (make-student "Virginia Woolf" 100 100 100))
(define at (make-student "Alan Turing" 90 80 40))
(define an (make-student "Anonymous" 30 55 10))

;; Calculating the average of the finals of students of hogwarts
;; (/ (foldr + 0 (map student-final hogwarts)) (length hogwarts))

(define classlist (cons vw (cons at (cons an empty))))

;; (name-list slist) produces a list of names in slist
;; name-list: (listof Student) -> (listof Str)
(define (name-list slist)
  (cond
    [(empty? slist) empty]
    [else (cons (student-name (first slist))
                (name-list (rest slist)))]))

(define-struct grade (name mark))
;; A Grade is a (make-grade Str Num)
;; requires:
;; 0 <= mark <= 100

;; Constants as helper functions
(define assts-weight .20)
(define mid-weight .30)
(define final-weight .50)

;; (final-grade astudent) produces a grade from the astudent, with
;; 20 for assignments, 30 for midterm, and 50 for final
;; final-grade: Student -> Grade
(define (final-grade astudent)
  (make-grade
   (student-name astudent)
   (+ (* assts-weight (student-assts astudent))
      (* mid-weight (student-mid astudent))
      (* final-weight (student-final astudent)))))
(define (compute-grades slist)
  (map final-grade slist))



