######################################################################
# GNU Makefile
######################################################################

.PHONY += all
all: ceasar.beam

test: all
	erl -run eunit test

clean:
	rm caesar.beam

ceasar.beam:
	erlc caesar.erl
