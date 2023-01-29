#lang racket

(require json)

;; (define file-story-path "")
(define file-story (open-input-file "./__tmp_story.json"))

(define json-story (read-json file-story))
(hash-eq? json-story)
(close-input-port file-story)
