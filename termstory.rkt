#lang racket

(require json)
(require "terminal.rkt")
(require "string.rkt")

(define termstory-version 0.1)

;; (define story-file-path "")
(define story-file (open-input-file "./data/stories/demo.json"))
(define story-json (read-json story-file))

(define (handle-command-line-arguments)
  (cond
    [(or (vector-member "--version" (current-command-line-arguments)) (vector-member "-v" (current-command-line-arguments)))
     (printf "termstory v~a\n" termstory-version)
     (exit)]))

(define (display-choices lst __idx)
  (cond 
    [(empty? lst) (newline)]
    [else
      (printf "(~a) ~a\n" __idx (first lst))
      (display-choices (rest lst) (+ __idx 1))]))

(define (story-iter story-json) 
  (if (not (vector-member "--no-terminal-clear" (current-command-line-arguments)))
    (clear-terminal-screen)
    (newline))

  (displayln (hash-ref story-json 'headline))
  (newline)

  (cond 
    [(empty? (hash-ref story-json 'options-action)) (newline)]
    [else
      (display-choices (hash-ref story-json 'options-input) 1)
      (display "> choose: ")
      (story-iter (list-ref (hash-ref story-json 'options-action) (- (string->number (remove-non-numeric-string (read-line))) 1)))]))

(define (story-begin story-json)
  (clear-terminal-screen)
  (cond 
    [(not (vector-member "--skip-title" (current-command-line-arguments)))
     (printf "Story Title: ~a\nPress enter to continue" (hash-ref story-json 'title))
     (read-line)])
  (story-iter (hash-ref story-json 'main-story)))

(handle-command-line-arguments)
(story-begin story-json)
(close-input-port story-file)
