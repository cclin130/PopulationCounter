function e = export(x, data, sampleName)
%combines x and y values into one matrix, exports to Microsoft Excel file

e = [x data];

fileName = [date '-' sampleName '-data.xls'];
str_population= [sampleName ' Cell Population (pixels)'];
col_header = {'Time (s)', str_population};

xlswrite(fileName, col_header, 'Sheet1', 'A1');
xlswrite(fileName, e, 'Sheet1', 'A2');