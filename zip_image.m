% zip_image.m -  Use Fourier Transform to resize image
% Fred J. Frigo, Ph.D.
% 02-Oct-2023
%
 
% Read color photo
function zip_image( imfile )


if(nargin == 0)
    [fname,iname] = uigetfile('*.*', 'Select Image file');
    imfile = strcat(iname, fname);
end

im = imread(imfile);  
figure();
imshow(im);
title("Color image");
 
% Convert to gray scale
gray = rgb2gray(im);

figure();
imshow(gray);
[row, col] = size(gray);
gray_title = sprintf("Original Gray Scale image: %d x %d", row, col);
title(gray_title);

% Take the magnitude of the FFT
F=fft2(double(gray));
S=fftshift(F);
L=abs(S);
A=log2(L);
figure();
imagesc(A)
axis image;
title("Magnitude of FFT image");

% Truncate or ZeroFill In Place (ZIP)
zip = 4.0;  % zip = 2 interpolate, 0.5 decimate
zip_row = row*zip;
zip_col = col*zip;

if zip < 1 
    a = row/2 - zip_row/2;
    b = row/2 + zip_row/2;
    c = col/2 - zip_col/2;
    d = col/2 + zip_col/2;
    reduce_buffer = S(a:b, c:d);
    zip_buffer = fftshift(reduce_buffer);
else
    a = zip_row/2 - row/2;
    b = zip_row/2 + row/2 - 1;
    c = zip_col/2 - col/2;
    d = zip_col/2 + col/2 - 1;
    interpolation_buffer = zeros( zip_row, zip_col);
    interpolation_buffer(a:b, c:d) = S;
    zip_buffer = fftshift(interpolation_buffer);
end

zip_complex = ifft2(zip_buffer);
zip_mag_image = abs(zip_complex);
zip_max = max(max(zip_mag_image));
zip_gray = (zip_mag_image/zip_max);

figure();
imshow(zip_gray);
resize_title = sprintf("Resized Gray Scale image: %d x %d", zip_row, zip_col);
title(resize_title);
