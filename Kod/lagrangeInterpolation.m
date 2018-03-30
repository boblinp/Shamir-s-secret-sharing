function [polinom] = lagrangeInterpolation(x, y, p)
%Lagranzova interpolacija 
%(x,y) su tacke u kojima se vrsi interpolacija
% p je prost broj (polje u kome se vrsi interpolacija)
% polinom - stepeni polinoma koji prolazi kroz sve tacke

n = length(x);
polinom = zeros(1, n); %inicijalizacija povratne vrednosti

for i = 1:n
    brojilac = 1;
    imenilac = 1;
    for j = 1:n
        if j~=i
            brojilac = gfconv( brojilac, [1, mod(-x(j),p)], p); 
            imenilac = imenilac *  mod( x(i) - x(j), p);
        end
    end    
    imenilac = mod(imenilac,p);
    L = gfdeconv(brojilac,imenilac,p);
    proizvod = gfconv(L,y(i),p);
    polinom = polinom + proizvod;
end
    polinom = mod(polinom,p);
end