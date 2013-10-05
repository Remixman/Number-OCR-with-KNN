function perf = performance_recognize()

k = 9;
test_num = 30;
correct_num = 0;
solutions = [8 7 4 9 5 2 3 1 0 8 4 5 8 7 3 4 5 6 6 3 5 4 1 8 2 9 6 5 0 9];

[training class] = load_training_data();

for i=1:test_num
    img_name = strcat('test/',int2str(i),'.png');
    img = imread(img_name);
    
    feature = zeros(1,25*25);
    feature(1,:) = im_feature(img);
    
    number = knnclassify(feature, training, class, k);
    
    if number == solutions(i)
        correct_num = correct_num + 1;
    else
        error = strcat('Predict : ', int2str(number), ' , Actual : ', int2str(solutions(i)));
        error
    end
end

perf = correct_num / test_num;