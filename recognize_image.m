function number = recognize_image(img_name, k)

img = imread(img_name);

imshow(img);

feature = zeros(1,25*25);
feature(1,:) = im_feature(img);

% training
[training class] = load_training_data();

% classify with knn
number = knnclassify(feature, training, class, k);
