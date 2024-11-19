% sobel_image.m - perform edge enhancement using sobel filter
%
% Fred J. Frigo, Ph.D.
% 20-Nov-2024
%

% Read color photo
function sobel_image( imfile )

if(nargin == 0)
    [fname,iname] = uigetfile('*.*', 'Select Image file');
    imfile = strcat(iname, fname);
end

im = imread(imfile);  
figure();
imshow(im);
title("Color image");
 
% Convert to gray scale
% gray = rgb2gray(im);   % sobel takes 'double' valued input image
gray = (0.2989 * double(im(:,:,1)) + ...
        0.5870 * double(im(:,:,2)) + ...
        0.1140 * double(im(:,:,3)))/255;

figure();
imshow(gray);

% 2D Sobel Filter
sobel_threshold = 0.5;  % for threshold use values of 0.01 to 1.0
edgeIm = sobel(gray, sobel_threshold); 
figure();
imshow(edgeIm);