function feature_vector = im_feature(im_matrix)

% threshoud image
gray_im_matrix = rgb2gray(im_matrix);
bi_im = im2bw(gray_im_matrix, 0.5);      % 0-1 image

% crop image
crop_im = bi_im(any(bi_im>0,2),any(bi_im>0,1));
crop_im = crop_im .* 255;

% dilate to smooth image
[width height] = size(gray_im_matrix);
dilate_im = imdilate(crop_im, ones(uint8(width*0.02),uint8(width*0.02)));

% crop again (after dilate)
crop_im = dilate_im(any(dilate_im<1,2),any(dilate_im<1,1)); % 0-1 image

% scale to 10 x 10
scale_im = imresize(crop_im, [10 10]);
scale_im = uint8(scale_im);

% return scaled image as feature
feature_vector = reshape(scale_im, 1, 10*10);
