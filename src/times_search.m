% measure searching times on growing the dimension of the dataset
% make only one search on both inear search and tree search (maybe with different parameters)
% the quality of the match doesn't care in this task

% for creation of the trees, the parameters max leaf size = 20, 
% Lmax = Dimension dataset / 20

clear all;
load('big_dataset.mat');

times_lin = [];
times_tree2 = [];
times_tree4 = [];
times_tree8 = [];
x = [];

i = 1;
dim = 100;
while dim < 5000%size(D, 1)
    D_small = D(1: dim);
    Q = D_small(randi(size(D_small, 1)));
    K = 3;
    Lmax = size(D_small, 1) / 20;
    % linear search
    tic;
    neighbors_lin = lin_search(D_small, Q, K);
    t1 = toc;
    % tree with branch factor 2
    T = create_tree(D_small, 2, 20);
    tic;
    neighbors_tree2 = tree_search(T, Q, K, Lmax);
    t2 = toc;
    % tree with branch factor 4
    T = create_tree(D_small, 4, 20);
    tic;
    neighbors_tree4 = tree_search(T, Q, K, Lmax);
    t3 = toc;
    % tree with branch factor 8
    T = create_tree(D_small, 8, 20);
    tic;
    neighbors_tree8 = tree_search(T, Q, K, Lmax);
    t4 = toc;
    
    fprintf('Dimension %d: %.3f s Linear\n', dim, t1);
    fprintf('Dimension %d: %.3f s Tree b2\n', dim, t2);
    fprintf('Dimension %d: %.3f s Tree b4\n', dim, t3);
    fprintf('Dimension %d: %.3f s Tree b8\n', dim, t4);    
    
    x(i) = dim;
    times_lin(i) = t1;
    times_tree2(i) = t2;
    times_tree4(i) = t3;
    times_tree8(i) = t4;
    i = i + 1;
    dim = dim + 100;
end


figure;
semilogy(x, times_lin, x, times_tree2, x, times_tree4, x, times_tree8);
legend('Linear search', 'Tree search BF=2', 'Tree search BF=4', 'Tree search BF=8');
title('Compare searching times');


