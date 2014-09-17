function centroids = computeCentroids(X, idx, K)
% X: dataset to run K-means on
% idx: list of centroid indexes for each example
% K: number of centroids, classes, colors

% computes the number of columns in X
n = size(X, 2);

% creates the matrix we will return containing the newly computed centroids
centroids = zeros(K, n);

% loops over each centroid
for i = 1:K

    % computes the centroid as the mean points of the examples which were
    % assigned this centroid previously
    centroids(i, :) = mean(X(find(idx == i), :));
end

end
