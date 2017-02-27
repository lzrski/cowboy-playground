-module(playground_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
	{ ok,
		cowboy_req:reply(
			200,
			#{ <<"content-type">> => <<"text/plain">> },
			io_lib:format("~w~n", [Req]),
			% <<"Hello, there! Welcome to my playground kid!">>,
			Req
		),
		State
	}.
