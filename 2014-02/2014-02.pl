% B-Prolog 8.0#1 - http://www.probp.com/
%
% Usage.
% Pass "[N, M, Black]." as an input:
% echo "[5, 3, 1]." | bp -g "cl('2014-02.pl'),main,halt" -l | tail -n +7

:- table josephus/3.
josephus(1, _, 1).
josephus(N, M, P) :-
    N > 1,
    N1 is N - 1,
    josephus(N1, M, P1),
    P is ((P1 + M - 1) mod N) + 1.

main :-
   read([N, K, Black]),
   josephus(N, K, P),
   X is ((Black - P) mod N) + 1 ,
   writeln(X).
