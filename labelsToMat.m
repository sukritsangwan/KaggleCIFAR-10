function labelsToMat()
% parse trainLabels.csv file to get labels
% store it into trainLabels.mat
% store numbers 1-10 representing object type instead of strings

y = zeros(50000, 1);

fil = fopen("trainLabels.csv");
line = fgetl(fil);
for i = 1:50000,
	line = fgetl(fil);
	if(strfind(line, "airplane") > 0),
		y(i) = 1;
	elseif(strfind(line, "automobile") > 0),
		y(i) = 2;
	elseif(strfind(line, "bird") > 0),
		y(i) = 3;
	elseif(strfind(line, "cat") > 0),
		y(i) = 4;
	elseif(strfind(line, "deer") > 0),
		y(i) = 5;
	elseif(strfind(line, "dog") > 0),
		y(i) = 6;
	elseif(strfind(line, "frog") > 0),
		y(i) = 7;
	elseif(strfind(line, "horse") > 0),
		y(i) = 8;
	elseif(strfind(line, "ship") > 0),
		y(i) = 9;
	elseif(strfind(line, "truck") > 0),
		y(i) = 10;
	end
end	
fclose(fil);

save "trainLabels.mat" y;

end
