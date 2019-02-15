% Verify the quality of the matching
% COmpare the tree search with the linear search, 
% that obviously is considered the optimal one, in the sense that
% it finds the optimal matching with respect to the euclidean distance.
% Also some figures are reported in order to visually appreciate the
% qualityof the matches.

clear all;
% load('dataset.mat');

from = imread("../images/bikes_feature.jpg");
to = imread("../images/bikes.jpg");
D_from = create_dataset_descriptors("../images/bikes_feature.jpg");
D_to = create_dataset_descriptors("../images/bikes.jpg");

% keypoints of the two figures
figure;
subplot(1,2,1);
show_keypoints(from, D_from);
title('Feature to match');
subplot(1,2,2);
show_keypoints(to, D_to);
title('Dataset image');

% create tree
tic;
branch_factor = 64;
max_leaf_size = 100;
T = create_tree(D_to, branch_factor, max_leaf_size);
t1 = toc;


% take a descriptor from 1 and match with 2
% tree search
d1 = D_from(1);

K = 3; % K nearest neighbors
Lmax = 150; % max number of examined nodes
tic;
neighbors = tree_search(T, d1, K, Lmax);
t2 = toc;

% matches using tree search
figure;
subplot(1,4,1);
imshow(patch_from_descriptor(from, d1));
title('Keypoint to match');
subplot(1,4,2);
imshow(patch_from_descriptor(to, neighbors(1)));
title('Match 1');
subplot(1,4,3);
imshow(patch_from_descriptor(to, neighbors(2)));
title('Match 2');
subplot(1,4,4);
imshow(patch_from_descriptor(to, neighbors(3)));
title('Match 3');
sgtitle('Matching using tree search');


% take a descriptor from 1 and match with 2
% linear search
tic;
neighbors_lin = lin_search(D_to, d1, K);
t3 = toc;

% match using linear search
figure;
subplot(1,4,1);
imshow(patch_from_descriptor(from, d1));
title('Keypoint to match');
subplot(1,4,2);
imshow(patch_from_descriptor(to, neighbors_lin(1)));
title('Match 1');
subplot(1,4,3);
imshow(patch_from_descriptor(to, neighbors_lin(2)));
title('Match 2');
subplot(1,4,4);
imshow(patch_from_descriptor(to, neighbors_lin(3)));
title('Match 3');
sgtitle('Matching using linear search');

% show keypoints
figure;
subplot(1,3,1);
show_keypoints(from, [d1]);
title('Feature to match');
subplot(1,3,2);
show_keypoints(to, neighbors_lin);
title('Matched features linear search');
subplot(1,3,3);
show_keypoints(to, neighbors);
title('Matched features tree search');

% display times
fprintf('Tree creation elapsed time: %.3f s\n', t1);
fprintf('Tree search elapsed time: %.3f s\n', t2);
fprintf('Linear search elapsed time: %.3f s\n', t3);



