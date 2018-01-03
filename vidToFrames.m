function [startFrame, numFrames, dir] = vidToFrames(vidName, sampleName)
%script converts a video into multiple frames
%places into folder named 'images'

dir = [date '-' sampleName '-frames'];
mkdir (dir);
cellVid = VideoReader(vidName);

k = 1;

while hasFrame(cellVid)
   img = readFrame(cellVid);
   filename = [sprintf('%03d',k) '.jpg'];
   fullname = fullfile(dir, filename);
   imwrite(img, fullname); %place image into folder
   
   %set start frame's file name
   if k == 1
        startFrame = fullname;
   end
   k = k+1;
end

numFrames = k-1;