clear all;
load('dataset.mat');

%X = ["lena.ppm", "../images/bark/img1.ppm", "../images/bikes/img1.ppm", "../images/boat/img1.pgm"];
% D = create_dataset_descriptors(X)

% D_small = D(1:10, :);
% T = create_tree(D_small, 3, 5);

[image, descrips, locs] = sift("lena.ppm");
%D = create_dataset_descriptors(X);
D_small = D(1:1352, :);

tic
T = create_tree(D_small, 3, 5);
t1 = toc;

Q = D_small(randi(size(D_small, 1)));

K = 2;
Lmax = 10;



tic
neighbors1 = tree_search(T, Q, K, Lmax);
t2 = toc;
tic
neighbors2 = lin_search(D, Q, K);
t3 = toc;

Q
neighbors1(1)
neighbors2(1)

fprintf('Tree creation elapsed time: %.3f s\n', t1);
fprintf('Tree search elapsed time: %.3f s\n', t2);
fprintf('Linear search elapsed time: %.3f s\n', t3);




% figure;
% imshow(image);
% for i = 1 : size(locs, 1)
%     hold on;
%     plot(locs(i, 1), locs(i, 2), 'gs', 'MarkerSize', locs(i, 3));
% end
