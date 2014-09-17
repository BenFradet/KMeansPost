function centroids = initCentroids(X, K)
% X: datase to run K-means on
% K: number of centroids/classes

% creates the matrix we should return as a (number of class, number of columns
% of our dataset) matrix
centroids = zeros(K, size(X, 2));

% gives a random permutation of the order of the rows in X
randIndex = randperm(size(X, 1));

% takes the first K examples according to the random permutation
centroids = X(randIndex(1:K), :);

end
