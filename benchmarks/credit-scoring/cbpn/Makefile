CC = /home/weijliu/llvm-mc/build/bin/clang

dataset = ../dataset

INC = -I./bpnn

FLAG = -lm

all: credit_score credit_score_train

credit_score: credit_score.c 
	$(CC) $< $(INC) $(FLAG) -o $@

credit_score_train: credit_score_train.c 
	$(CC) $< $(INC) $(FLAG) -o $@

clean:
	rm -f *.o credit_score credit_score_train
