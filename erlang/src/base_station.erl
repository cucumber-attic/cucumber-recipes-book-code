% START:module
-module(base_station).
% END:module

% START:main
-export([given/3, 'when'/3, then/3, main/0]).

main() ->
  cucumberl:run("./features/base_station.feature").
% END:main

% START:world
-record(world,
        {bestChannel=none}).
% END:world

% START:given
given([a, call, on, channel, _], _, _) ->
  {ok, #world{}}.
% END:given

% START:when
'when'([the, signal, quality, is, better, on, channel, Channel], World, _) ->
  {ok, World#world{bestChannel=Channel}}.
% END:when

% START:then
then([the, call, should, hand, off, to, channel, Channel], World, _) ->
   World#world.bestChannel =:= Channel.
% END:then
