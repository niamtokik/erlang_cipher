-module(blake3).

iv(0) ->
    16#6a09e667;
iv(1) ->
    16#bb67ae85;
iv(2) ->
    16#3c6ef372;
iv(3) ->
    16#a54ff53a;
iv(4) ->
   16#510e527f;
iv(5) ->
    16#9b05688c;
iv(6) ->
    16#1f83d9ab;
iv(7) ->
    16#5be0cd19.

btree() ->
    [].

leaf(Value) ->
    {leaf, Value}.

parent(Leaf, Leaf) ->
    {Leaf, Leaf}.

chunk(Btree, Chunk) ->
    ok.

permutation() ->
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    ,[2, 6, 3, 10, 7, 0, 4, 13, 1, 11, 12, 5, 9, 14, 15, 8]
    ].

hash(Bitstring) ->
    blake(Bitstring, []).

hash(Bitstring, Opts) ->
    blake(Bitstring, <<0:128>>, Opts).

blake(<<Chunk:8192, Rest/bitstring>>, Buffer, Opts) ->
    ok.

compress(<<Word:32, Rest>>) ->
    ok.







