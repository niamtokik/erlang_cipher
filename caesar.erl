%%%-------------------------------------------------------------------
%%% @doc caesar module
%%% @end
%%%-------------------------------------------------------------------
-module(caesar).
-export([encrypt/2, decrypt/2]).
-include_lib("eunit/include/eunit.hrl").

%%--------------------------------------------------------------------
%% @doc encrypt/2
%% @end
%%--------------------------------------------------------------------
-spec encrypt(List, Shift) -> Return when
      List :: list() | binary() | bitstring(),
      Shift :: integer(),
      Return :: list().
encrypt(List, Shift) 
  when is_binary(List) orelse is_bitstring(List) ->
    Convert = erlang:binary_to_list(List),
    encrypt(Convert, Shift);
encrypt(List, Shift) ->
    encrypt(List, Shift, []).

-spec encrypt(List, Shift, Buffer) -> Return when
      List :: list(),
      Shift :: integer(),
      Buffer :: list(),
      Return :: list().
encrypt([], _Shift, Buffer) ->
    Buffer;
encrypt([Head|Tail], Shift, Buffer) ->
    E = ((Head-$a+26+Shift) rem 26) + $a,
    encrypt(Tail, Shift, Buffer ++ [E]).

encrypt_test() ->
    ?assertEqual("abcdefghijklmnopqrstuvwxyz", encrypt(alphabet(), 0)),
    ?assertEqual("bcdefghijklmnopqrstuvwxyza", encrypt(alphabet(), 1)),
    ?assertEqual("mnopqrstuvwxyzabcdefghijkl", encrypt(alphabet(), 12)).

%%--------------------------------------------------------------------
%% @doc decrypt/2
%% @end
%%--------------------------------------------------------------------
-spec decrypt(List, Shift) -> Return when
      List :: list() | binary() | bitstring(),
      Shift :: integer(),
      Return :: list().
decrypt(List, Shift) 
  when is_binary(List) orelse is_bitstring(List) ->
    Convert = erlang:binary_to_list(List),
    decrypt(Convert, Shift);
decrypt(List, Shift) ->
    decrypt(List, Shift, []).

-spec decrypt(List, Shift, Buffer) -> Return when
      List :: list(),
      Shift :: integer(),
      Buffer :: list(),
      Return :: list().
decrypt([], _Shift, Buffer) ->
    Buffer;
decrypt([Head|Tail], Shift, Buffer) ->
    
    D = ((Head-$a+26-Shift) rem 26) + $a,
    decrypt(Tail, Shift, Buffer ++ [D]).

decrypt_test() ->
    ?assertEqual("abcdefghijklmnopqrstuvwxyz", decrypt(alphabet(), 0)),
    ?assertEqual("zabcdefghijklmnopqrstuvwxy", decrypt(alphabet(), 1)),
    ?assertEqual("mnopqrstuvwxyzabcdefghijkl", decrypt(alphabet(), -12)).

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
-spec alphabet() -> list().
alphabet() ->
    "abcdefghijklmnopqrstuvwxyz".
