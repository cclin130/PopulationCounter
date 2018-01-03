function count = countPixels2(imgName, RGB, accuracy)
%script counts the number of pixels in an image that is near a given RGB
%RGB deviations averaged for consideration

img = imread(imgName);
%find height and width of image to specify an area to inspect
[height, width, ~] = size(img);

%define dimensinos of region to be inspected
regionHeight = round(height);
regionWidth = round(width);

allPixelRGB = zeros(3, regionWidth.*regionHeight);

k=1;
for x = 1:regionWidth
    for y = 1:regionHeight
        idx_width = round(width/2 - regionWidth/2 + x);
        idx_height = round(height/2 - regionHeight/2 + y);
        
        allPixelRGB(1, k) = img(idx_height, idx_width, 1);
        allPixelRGB(2, k) = img(idx_height, idx_width, 2);
        allPixelRGB(3, k) = img(idx_height, idx_width, 3);
        k = k+1;
    end
end

%Difference divided by
avgDev = (abs(allPixelRGB(1,:)-RGB(1))/255 + abs(allPixelRGB(2,:)-RGB(2))/255 + abs(allPixelRGB(3,:)-RGB(3))/255)/3;
countRGB =  avgDev < accuracy;

count = sum(countRGB);