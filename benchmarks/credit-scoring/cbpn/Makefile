CC = /home/weijliu/llvm-mc/build/bin/clang

INC = -I./bpnn
LIB = -L.

FLAG = -lBPNN -lm

all: test_bpnn test_bpnn_train

test_bpnn: test_bpnn.c
	$(CC) $< $(INC) $(LIB) $(FLAG) -o $@

test_bpnn_train: test_bpnn_train.c
	$(CC) $< $(INC) $(LIB) $(FLAG) -o $@

clean:
	rm -f test_bpnn test_bpnn_train
