function [centroids, idx] = runKMeans(X, initialCentroids, iter)
%X: dataset to run K-means on
%initialCentroids: intial centroids computed by initCentroids
%iter: number of iterations to perform

% computes the number of examples in the dataset
m = size(X, 1);

% computes the number of centroids, classes, colors
K = size(initialCentroids, 1);

% initialize the centroids variable with the initialCentroids value
centroids = initialCentroids;

% creates a columnar vector which will hold the index of the centroid every
% example has been assigned to
idx = zeros(m, 1);

% loops for iter iterations
for i = 1:iter
    fprintf('K-means iteration %d/%d\n', i, iter);

    % assign centroids to every example
    idx = assignCentroids(X, centroids);

    % computes new centroids from the assignments done in assignCentroids
    centroids = computeCentroids(X, idx, K);
end

end
