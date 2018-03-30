function [ original ] = decryptMod( shadows, x, p, originalVelicina )
%DECRYPT - od senki stvara originalnu matricu
%Dekripcija za modifikovanu verziju enkripcije
%senke
%x - koristeni brojevi
%p - prost broj(za moduo)
%originalVelicina - velicina originalne slike

original = ones( originalVelicina(1),originalVelicina(2));

[visina,sirina,brojSenki] = size(shadows);
brojPikselaSenke = visina*sirina;

%izracunaj k
k = (originalVelicina(1)*originalVelicina(2))/(visina*sirina);
%odbaci visak senki
if brojSenki > k
    brojSenki = k;
    x = x(1:k); %odbaci i nepotrebne x
end

%uzimaj piksel po piksel iz senki i racunaj koeficijente za taj
for i = 1:visina*sirina
    %uzima se piksel sa indeksom i iz svake senke
    y = shadows(i:brojPikselaSenke:i + (brojSenki-1)*brojPikselaSenke);  
    %Lagranzevom interpolacijom nalaze se koeficijenti polinoma     
    koeficijenti = lagrangeInterpolation(x,y,p);    
    %prepisi ih u originalu sliku    
    original(i:brojPikselaSenke:(length(koeficijenti)-1)*brojPikselaSenke + i) = koeficijenti;
end

end
