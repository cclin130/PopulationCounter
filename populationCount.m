function c = populationCount(vidName, sampleName, accuracy, framerate)
%function runs the population counter
%input argument is a video filepath compatible with MATLAB's videoReader,
%desired name for the sample, desired accuracy (recommended 0.1 for 10%),
%and framerate of camera


%run vid to frames method
[startFrame, numFrames, dir] = vidToFrames(vidName, sampleName);

%find the RGB in question using the startFrame
RGB = findRGB(startFrame);

%obtain array with population entries
data = getPopulation(numFrames, RGB, accuracy, dir);

%display data
x = displayFigure(data, framerate, numFrames, sampleName);

%export data
export(x, data, sampleName);

