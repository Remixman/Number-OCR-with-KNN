function number = recognize_image(img_name)

img = imread(img_name);
feature = zeros(1,20*20);
feature(1,:) = im_feature(img);

% training
[training class] = load_training_data();

% classify with knn
number = knnclassify(feature, training, class);
