clear all;

%load('dataset.mat');

% X = ["../images/bark/img1.ppm", "../images/bikes/img1.ppm", "../images/boat/img1.pgm"]
% D = create_dataset_descriptors(X)


% D_small = D(1:10, :);
% T = create_tree(D_small, 3, 5);

[image, descrips, locs] = sift("lena.ppm");
D = create_dataset_descriptors("lena.ppm");
D_small = D(1:30, :);
T = create_tree(D_small, 3, 5);

Q = D_small(randi(size(D_small, 1)));

K = 2;
Lmax = 10;
neighbors = tree_search(T, Q, K, Lmax);


Q
neighbors(1)



















% figure;
% imshow(image);
% for i = 1 : size(locs, 1)
%     hold on;
%     plot(locs(i, 1), locs(i, 2), 'gs', 'MarkerSize', locs(i, 3));
% end


% pq = PriorityQueue();
% pq.push(10, [1, 2, 3]);
% pq.push(5, [4, 5, 6]);
% pq.push(7, [7, 8, 9]);
% 
% [a, b] = pq.pop()
% [c, d] = pq.pop()
% disp(pq.size())
% [e, f] = pq.pop()
% 
% disp(pq.size())




% j = imresize(image, locs(1, 3));
% figure;
% imshow(j);