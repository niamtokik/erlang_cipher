-module(vigenere).
-export([encrypt/2, decrypt/2]).
-include_lib("eunit/include/eunit.hrl").

encrypt(_,_) ->
    ok.

encrypt_test() ->
    ?assertEqual("cfcnvm", encrypt("attack", "clint")).

decrypt(_,_) ->
    ok.

decrypt_test() ->
    ?assertEqual("attack", decrypt("cfcnvm", "clint")).


