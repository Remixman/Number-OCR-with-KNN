function feature_vector = im_feature(im_matrix)

% threshoud image
gray_im_matrix = rgb2gray(im_matrix);
bi_im = im2bw(gray_im_matrix, 0.5);      % 0-1 image

% crop image
crop_im = bi_im(any(bi_im<1,2),any(bi_im<1,1));
crop_im = crop_im .* 255;

% erode to smooth image
[width height] = size(gray_im_matrix);
erode_im = imerode(crop_im, ones(uint8(width*0.05),uint8(width*0.05)));

% scale to 25 x 25
scale_im = imresize(erode_im, [25 25]);
scale_im = uint8(scale_im);

% return scaled image as feature
feature_vector = reshape(scale_im, 1, 25*25);
