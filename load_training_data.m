function [training class] = load_training_data()

category_num = 10;
cate_train_num = 12;
total_train_num = category_num * cate_train_num;

class = zeros(total_train_num, 1);
training = zeros(total_train_num, 25* 25);

class_count = 1;

for cate=0:9
    for n=1:cate_train_num
        imname = strcat('train/', int2str(cate), '/', int2str(n), '.png');
        img = imread(imname);
        
        class(class_count) = cate;
        training(class_count,:) = im_feature(img);
        
        class_count = class_count + 1;
    end
end
