function X = pngBatchToMat(sampleNumbers)
% return a vector representation of the png file

for i = sampleNumbers,
	fileName = 'train/' + i + '.png';
	[R, G, B] = imread(fileName);
	X = [X ((R + G + B)'(:))'];
end

end
