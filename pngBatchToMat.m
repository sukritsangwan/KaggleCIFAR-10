function X = pngBatchToMat(sampleNumbers)
% return a vector representation of the png file

X = [];

for i = sampleNumbers,
	fileName = strcat('train/', mat2str(i), '.png');
	pix = imread(fileName);
	X = [X; ((sum(pix, 3))'(:))'];
end

X = [ones(size(X, 1), 1) X];

end
