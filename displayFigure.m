function x = displayFigure(data, framerate, numFrames, sampleName)
%create a figure that plots data against time

x = [0:framerate:(framerate*numFrames-1)]';

figure('Name', 'Population Counter', 'Position', [100, 100, 700, 600])

%count pixels in images
hold on;

plot(x, data)
%add graph labels
str_title = [sampleName ' Cell Population vs. Time'];
title(str_title);
xlabel('time (s) ->');
str_y = [sampleName ' Cell Population (pixels) ->'];
ylabel(str_y);

%save data
fileName = [date '-' sampleName '-graph.jpg'];
saveas(gcf, fileName);