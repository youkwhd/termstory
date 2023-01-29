#lang racket

(require json)

;; (define file-story-path "")
(define file-story (open-input-file "./__tmp_story.json"))
(define json-story (read-json file-story))

(define (display-choices lst __idx)
  (cond 
    [(empty? lst) (newline)]
    [else
      (printf "(~a) ~a\n" __idx (first lst))
      (display-choices (rest lst) (+ __idx 1))]))

(displayln (hash-ref json-story 'headline))
(newline)
(display-choices (hash-ref json-story 'choices) 1)
(close-input-port file-story)
