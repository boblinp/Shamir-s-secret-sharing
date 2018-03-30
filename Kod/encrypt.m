function [ shadows, x ] = encrypt( A, k, n, p )
%ENCRYPT - stvara senke od matrice
%shadows - generisane senke
%x - koristeni brojevi
%A - matrica sa vrednostima boja
%n - broj senki koje treba generisati
%k - broj senki potrebnih da se generise matrica A
%p - prost broj(za moduo)


%incijalizacija senki
velicinaSlike = size(A);
brojPiksela = velicinaSlike(1)*velicinaSlike(2); %koliko piksela ukupno ima slika 
brojPikselaSenke = brojPiksela/k; %svaka senka je 1/k ukupne slike

%racunanje dimenzija
a = int64(sqrt(brojPikselaSenke));
%ne mora da znaci da je ukupan broj piksela deljiv sa tim, trazi prvi s kojim jeste
for i = a:-1:1
    if( rem(brojPikselaSenke,i) == 0 )
        a = i;
        break;
    end
end
b = brojPikselaSenke/a;

shadows = zeros(b,a,n);

%za svakog od n delilaca generise se jedinstven broj x
%trenutno je to redni broj senke
x = 1:n;

%racunanje senki
for i = 1:brojPikselaSenke %racuna se piksel i iz svake senke    
    %uzima se k piksela iz originalne slike i oni predstavljaju koeficijente polinoma    
    pocetak = (i-1)*k + 1;
    kraj = pocetak + k - 1;
    polinom = A(pocetak:kraj);
    
    %iskoristi se generisani broj x da bi se dobila vrednost tog piksela u senci     
    shadows( i:brojPikselaSenke:i+(n-1)*brojPikselaSenke) = mod(polyval(polinom,x),p);    
end

end