#lang racket

(require json)

;; (define story-file-path "")
(define story-file (open-input-file "./data/stories/demo.json"))
(define story-json (read-json story-file))

(define (clear-terminal-screen)
  (displayln "\033c"))

(define (display-choices lst __idx)
  (cond 
    [(empty? lst) (newline)]
    [else
      (printf "(~a) ~a\n" __idx (first lst))
      (display-choices (rest lst) (+ __idx 1))]))

(define (story-iter story-json) 
  (if (not (vector-member "--no-terminal-clear" (current-command-line-arguments)))
    (clear-terminal-screen))

  (displayln (hash-ref story-json 'headline))
  (newline)

  (cond 
    [(empty? (hash-ref story-json 'options-action)) (newline)]
    [else
      (display-choices (hash-ref story-json 'options-input) 1)
      (display "> choose: ")
      (story-iter (list-ref (hash-ref story-json 'options-action) (- (string->number (read-line)) 1)))]))

(define (story-begin story-json)
  (clear-terminal-screen)
  (cond 
    [(not (vector-member "--skip-title" (current-command-line-arguments)))
     (printf "Story Title: ~a\nPress enter to continue" (hash-ref story-json 'title))
     (read-line)])
  (story-iter (hash-ref story-json 'main-story)))

(story-begin story-json)
(close-input-port story-file)
