-module(handset).

-export([given/3, main/0]).

main() ->
  cucumberl:run("./features/handset.feature").

% START:given
given([a, call, is, in, progress], World, _) ->
    {ok, World};
given([no, calls, are, in, progress], World, _) ->
    {ok, World}.
% END:given
