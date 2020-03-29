-module(blake3_server).
-compile(export_all).
-behaviour(gen_server).
-record(state, { leaf = undefined :: reference()
               , parent = undefined :: reference()
               }).

init(_Args) ->
    Leaf = ets:new(leaf, [ordered_set, protected]),
    Parent = ets:new(parent, [ordered_set, protected]),
    {ok, #state{ leaf = Leaf
               , parent = Parent 
               }}.

handle_cast({add, Value}, State) ->
    {noreply, State};
handle_cast({del, Value}, State) ->
    {noreply, State}.

handle_call({get, parent}, From, #state{ parent = Parent } = State) ->
    Return = ets:match(Parent, {'$1', '$2'}),
    {reply, Return, State};
handle_call({get, leaf}, From, #state{ leaf = Leaf } = State) ->
    Return = ets:match(Leaf, {'$1', '$2'}),
    {reply, Return, State};
handle_call({get, state}, From, State) ->
    {reply, State, State}.

add_leaf(Value, #state{ leaf = L, parent = P } = State) ->
    case ets:last(L) of
        '$end_of_table' -> ets:insert(L, {0, Value});
        X when is_integer(X) -> ets:insert(L, {X+1, Value})
    end.

add_parent(L1, L2, #state{ leaf = L, parent = P } = State) ->
    ok.
