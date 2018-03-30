function [ R, G, B ] = readImage( imageName )
%readImage - ucitava sliku
%Vraca tri matrice, R - red, G - green, B - blue

I = imread(imageName);

R = uint8(I(:,:,1));
G = uint8(I(:,:,2));
B = uint8(I(:,:,3));


end

