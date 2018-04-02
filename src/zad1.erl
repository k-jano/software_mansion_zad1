%%%-------------------------------------------------------------------
%%% @author Kuba Jano
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. kwi 2018 13:50
%%%-------------------------------------------------------------------
-module(zad1).
-author("Kuba Jano").

%% API
-export([twoSequences/2]).


twoSequences([],_ )->[];
twoSequences(L, [])->L;
twoSequences([H|T], L)->
  case isPrime(howManyTimes(L, H)) of
    true -> [H]++twoSequences(T, L);
    false-> []++twoSequences(T,L)
  end.


howManyTimes([],_)->0;
howManyTimes([H|T], H)-> 1+howManyTimes(T, H);
howManyTimes([_|T], X)-> howManyTimes(T, X).

isPrime(0)-> false;
isPrime(1)-> false;
isPrime(2)-> true;
isPrime(N) -> isPrime(N,2).
isPrime(N,N) -> true;
isPrime(N,M)->
  ChPrime = N rem M,
  if
    ChPrime == 0 -> false;
    true -> isPrime(N,M+1)
  end.
