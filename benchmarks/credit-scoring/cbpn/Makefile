CC = /home/weijliu/llvm-mc/build/bin/clang

dataset = ../dataset

INC = -I./bpnn
LIB = -L.

FLAG = -lBPNN -lm

all: credit_score credit_score_train

credit_score: credit_score.c
	$(CC) $< $(INC) $(LIB) $(FLAG) -o $@

credit_score_train: credit_score_train.c
	$(CC) $< $(INC) $(LIB) $(FLAG) -o $@

clean:
	rm -f credit_score credit_score_train
