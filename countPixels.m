%script counts the number of pixels in an image that is near a given RGB
%deviation considers each RGB value independently

%pixels should be 10% similar in RGB values
accuracy = 0.1;

img = imread('trialFrames\001.jpg');
%find height and width of image to specify an area to inspect
[height, width, dim_colour] = size(img);

%define dimensinos of region to be inspected
regionHeight = round(height/3);
regionWidth = round(width/3);

RGB = [188;39;41];

count = 0;

for x = 1:regionWidth
    for y = 1:regionHeight
        idx_width = width/2 - regionWidth/2 + x;
        idx_height = height/2 - regionHeight/2 + y;
        temp_pixelRGB = impixel(img, idx_width,idx_height);
        
        %check to see if pixel is close in colour to desired RGB
        
        addCount = true;
        %if any of the RGB values differ by more than 10% from desired RGB
        if (abs(temp_pixelRGB(1)-RGB(1))/RGB(1)) > accuracy
            addCount = false;
        end
        if (abs(temp_pixelRGB(2)-RGB(2))/RGB(2)) > accuracy
            addCount = false;
        end
        if (abs(temp_pixelRGB(3)-RGB(3))/RGB(3)) > accuracy
            addCount = false;
        end
        
        if addCount
            count = count+1;
        end
    end
end

disp(count)