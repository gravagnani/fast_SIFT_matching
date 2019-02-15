% measure the time needed to compute multiple searches
% compare times of linear search and tree search with branch factor
% in the cases 2, 4 and 8
% keep the dataset dimension constant equal to 3000
% K constant = 1
% keep the trees constant

clear all;
load('big_dataset.mat');

max_searches = 200;
K = 1;
Lmax = 150;
times_lin = ones(1, max_searches);
times_tree2 = ones(1, max_searches);
times_tree4 = ones(1, max_searches);
times_tree8 = ones(1, max_searches);
x = 1 : max_searches;

D_small = D(randperm(size(D, 1), 3000));

tic;
T2 = create_tree(D_small, 2, 20);
t1 = toc;
tic;
T4 = create_tree(D_small, 4, 20);
t2 = toc;
tic;
T8 = create_tree(D_small, 8, 20);
t3 = toc;

fprintf('Creation tree Tree b2: %.3f\n', t1);
fprintf('Creation tree Tree b4: %.3f\n', t2);
fprintf('Creation tree Tree b8: %.3f\n', t3); 

times_tree2 = times_tree2 * t1;
times_tree4 = times_tree4 * t2;
times_tree8 = times_tree8 * t3;

for i = 1 : max_searches
    i
    % linear search
    for j = 1 : i
       Q = D_small(randi(size(D_small, 1)));
       tic;
       neighbors = lin_search(D_small, Q, K);
       t = toc;
       times_lin(i) = times_lin(i) + t;
    end
    % tree search BF=2
    for j = 1 : i
       Q = D_small(randi(size(D_small, 1)));
       tic;
       neighbors2 = tree_search(T2, Q, K, Lmax);
       t = toc;
       times_tree2(i) = times_tree2(i) + t;
    end
    % tree search BF=4
    for j = 1 : i
       Q = D_small(randi(size(D_small, 1)));
       tic;
       neighbors4 = tree_search(T4, Q, K, Lmax);
       t = toc;
       times_tree4(i) = times_tree4(i) + t;
    end
    % tree search BF=8
    for j = 1 : i
       Q = D_small(randi(size(D_small, 1)));
       tic;
       neighbors8 = tree_search(T8, Q, K, Lmax);
       t = toc;
       times_tree8(i) = times_tree8(i) + t;
    end
    
end


figure;
semilogy(x, times_lin, x, times_tree2, x, times_tree4, x, times_tree8);
legend('Linear search', 'Tree search BF=2', 'Tree search BF=4', 'Tree search BF=8');
xlabel('Number of searches');
ylabel('Time (s)');
title('Compare multiple searching times with tree creation');