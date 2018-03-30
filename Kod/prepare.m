function [ B ] = prepare( A, p )
%PREPARE vrsi pretprocesiranje slike
%Sve vrednosti vece od p, pretvori u p

B = double(A);
B( B >= p ) = p - 1;

end