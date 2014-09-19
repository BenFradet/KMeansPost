#!/usr/bin/octave -q

fprintf('Running K-means\n\n')

% parse command line arguments

% path to the original img
originalImgPath = argv(){1};

% path to the compressed img
newImgPath = argv(){2};

% number of classes/colors wanted
K = str2num(argv(){3});

% number of iterations to run the algorithm
iter = str2num(argv(){4});

% read the img as a length * width * 3 matrix
img = double(imread(originalImgPath));

% normalize the values from 0 to 255 to 0 to 1
img = img / 255;

% store the length and width of the img
imgSize = size(img);

% reshape the matrix from an img * width * 3 to a 2-dimensionnal matrix
% ((length * width), 3)
X = reshape(img, imgSize(1) * imgSize(2), 3);

% pick K pixel as initial centroids
initialCentroids = initCentroids(X, K);

% run the K-means algorithm from those initial centroids
[centroids, idx] = runKMeans(X, initialCentroids, iter);

% reassign the centroids a final time in order to recover the compressed img
idx = assignCentroids(X, centroids);

% map the pixel in the image to their affected centroid
compressedImg = centroids(idx, :);

% reshape the ((length * width), 3) matrix to a (length, width, 3) matrix so
% it can be written out
compressedImg = reshape(compressedImg, imgSize(1), imgSize(2), 3);

% write the image to the specified file
imwrite(compressedImg, newImgPath);
