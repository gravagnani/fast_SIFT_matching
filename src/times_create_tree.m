% In this class we want to visualize the time
% needed to create the tree. We use a big dataset of descriptors
% of images taken from http://www.robots.ox.ac.uk/~vgg/data/data-aff.html
% examine the time with respect the dimension of the dataset.

clear all;
load('big_dataset.mat');

% X = ["../images/bark/img1.ppm", "../images/bikes/img1.ppm", "../images/boat/img1.pgm", "../images/graf/img1.ppm", "../images/leuven/img1.ppm", "../images/trees/img1.ppm", "../images/ubc/img1.ppm", "../images/wall/img1.ppm"];
% D = create_dataset_descriptors(X);

times = [];
x = [];

i = 1;
dim = 100;
while dim < 5000%size(D, 1)
    D_small = D(1: dim);
    branch_factor = 8;
    max_leaf_size = 20;
    tic;
    T = create_tree(D_small, branch_factor, max_leaf_size);
    t = toc;
    fprintf('Dimension %d: %.3f s\n', dim, t);
    x(i) = dim;
    times(i) = t;
    i = i + 1;
    dim = dim + 100;
end


figure;
plot(x, times);
xlabel("Dimension of Dataset");
ylabel("Time (seconds)");
title("Time to create the Tree");