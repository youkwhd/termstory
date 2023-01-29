#lang racket

(require json)

;; (define story-file-path "")
(define story-file (open-input-file "./__tmp_story.json"))
(define story-json (read-json story-file))

(define (display-choices lst __idx)
  (cond 
    [(empty? lst) (newline)]
    [else
      (printf "(~a) ~a\n" __idx (first lst))
      (display-choices (rest lst) (+ __idx 1))]))

(define (story-begin story-json) 
  (newline)
  (displayln (hash-ref story-json 'headline))
  (newline)

  (cond 
    [(empty? (hash-ref story-json 'option)) (newline)]
    [else
      (display-choices (hash-ref story-json 'choices) 1)
      (display "> choose: ")
      (story-begin (list-ref (hash-ref story-json 'option) (- (string->number (read-line)) 1)))]))

(story-begin story-json)
(close-input-port story-file)
