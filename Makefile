EXE = termstory
CC = raco exe
# CFLAGS = 

SRC = $(wildcard $(EXE).rkt)

all: $(EXE)

$(EXE): $(SRC)
	$(CC) $^

clean:
	$(RM) $(EXE)

.PHONY: $(EXE) clean
