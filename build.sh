#!/bin/sh

COMPILER="raco exe"
SOURCE="termstory.rkt"

__eval() {
    echo $1
    eval $1
}

__eval "$COMPILER $SOURCE"
