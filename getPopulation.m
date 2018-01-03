function data = getPopulation(numFrames, RGB, accuracy, dir)
%obtain data set with count of pixels with desired RGB

%create empty array
data = zeros(numFrames,1);

%enter count of each pixel into respective array entry
for k = 1:numFrames
    filename = [sprintf('%03d',k) '.jpg'];
    imgName = fullfile(dir, filename);
    img = imread(imgName);
    count = countPixels2(imgName, RGB, accuracy);
    
    data(k, 1) = count;
end