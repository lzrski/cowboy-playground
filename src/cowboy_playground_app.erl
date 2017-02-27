-module(cowboy_playground_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{ '_', [{ "/", playground_handler, [] }] }
	]),
	{ ok, _ } = cowboy:start_clear(
		playground_http_listener,
		100,
		[{ port, 8080 }],
		#{env => #{dispatch => Dispatch}}
	),
	cowboy_playground_sup:start_link().

stop(_State) ->
	ok.
