function RGB = findRGB(startFrame)
%script finds RGB values which indicate a bacteria cell

img = imread(startFrame);
%find height and width of image to specify an area to inspect
[height, width, ~] = size(img);

%define dimensinos of region to be inspected
regionHeight = round(height/1.5);
regionWidth = round(width/1.5);

%collect RGB values
pixelRGB = zeros(3, regionWidth.*regionHeight);

k=1;
for x = 1:regionWidth
    for y = 1:regionHeight
        idx_width = round(width/2 - regionWidth/2 + x);
        idx_height = round(height/2 - regionHeight/2 + y);
        
        pixelRGB(1, k) = img(idx_height, idx_width, 1);
        pixelRGB(2, k) = img(idx_height, idx_width, 2);
        pixelRGB(3, k) = img(idx_height, idx_width, 3);

        k = k+1;
    end
end

%find pixel that deviates from the others the greatest (greatest contrast)
R = pixelRGB(1, :);
avg_R = mean(R);
G = pixelRGB(2, :);
avg_G = mean(G);
B = pixelRGB(3, :);
avg_B = mean(B);


pixelDev = zeros(3, regionWidth.*regionHeight);

for k = 1:regionWidth*regionHeight
    pixelDev(1, k) = abs(pixelRGB(1,k)-avg_R);
    pixelDev(2, k) = abs(pixelRGB(2,k)-avg_G);
    pixelDev(3, k) = abs(pixelRGB(3,k)-avg_B);
end

%find pixel with greatest total deviation
totalDev = pixelDev(1, :) + pixelDev(2, :) + pixelDev(3, :);
[~, idx_max] = max(totalDev);

RGB = [pixelRGB(1,idx_max); pixelRGB(2, idx_max); pixelRGB(3, idx_max)];

str = sprintf('Pixels with R = %03d, G = %03d, B = %03d, will be counted.',RGB(1), RGB(2), RGB(3));
disp(str)