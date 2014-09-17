function idx = assignCentroids(X, centroids)
% X: dataset to run K-means on
% centroids: list of the current centroids

% computes K from the number of centroids
K = size(centroids, 1);

% creates the matrix we will return, a matrix containing the index of the
% affected centroid for each example in our dataset X
idx = zeros(size(X, 1), 1);

% loops over each example in X
for i = 1:size(X, 1)

    % initialize a vector of distances between the ith example and the K
    % centroids
    distances = zeros(1, K);

    % loops over each centroid
    for j = 1:size(K, 1)

        % computes the distance between the ith example et the jth centroid
        distances[1, j] = sumsq(X(i, :) - centroids(j, :));
    end

    % gets the index of the centroid with minimum distance for this example
    [one, idx(i)] = min(distances);
end

end
