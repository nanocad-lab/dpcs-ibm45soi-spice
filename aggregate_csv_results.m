function [fet_iv] = aggregate_csv_results(input_file_directory, input_csv_filenames, output_file_directory, output_csv_filename, num_voltages)
% Author: Mark Gottscho
% mgottscho@ucla.edu
%
% This function takes a set of input CSVs that contain voltage/current
% (I-V) data from a single SPICE simulation. It outputs an aggregated CSV
% as a column-wise concatenation of the input files, but with only one
% voltage column. For example, given input files:
%
% hvtnfet_on.csv
% hvtnfet_off.csv
% lvtnfet_on.csv
% lvtnfet_off.csv
%
% Each input file is of the same format (all files must have exactly
% 2 columns and equal number of rows -- num_voltages):
%
% voltage(V),current(A)
% 1.0000e+00,8.114e-05
% ...
%s
% The output file is of the format:
%
% ,hvtnfet_on,hvtnfet_off,lvtnfet_on,lvtnfet_off
% voltage(V),current(A),current(A),current(A),current(A)
% 1.0000e+00,8.114e-05,...
% ...
%
% The same I-V table that is written to a file is returned as fet_iv, but
% without header rows.

num_files = size(input_csv_filenames, 2);
fet_iv = NaN(num_voltages, num_files+1);

for i=1:num_files
    raw_file_input = csvread([input_file_directory '/' input_csv_filenames{i}], 1, 0); % Read in the file but skip header row
    if i == 1
        fet_iv(:,1) = raw_file_input(:,1); % Set voltage column 1 only from first file. We assume all files use same voltages.
    end
    fet_iv(:,i+1) = raw_file_input(:,2); % Store current for this file
end

% Write to CSV file with header rows
fid = fopen([output_file_directory '/' output_csv_filename], 'w'); % Open for write

% First header row
fprintf(fid, ','); % Skip first cell
for i=1:num_files
    fprintf(fid, '%s,', strtok(input_csv_filenames{i}, '.')); % Write filename
end
fprintf(fid, '\n');

% Second header row
fprintf(fid, 'voltage(V),');
for i=1:num_files
    fprintf(fid, 'current(A),');
end
fprintf(fid, '\n');

% Print fet_iv values
for row = 1:size(fet_iv,1)
    for col = 1:size(fet_iv,2)
       fprintf(fid, '%E,', fet_iv(row,col)); 
    end
    fprintf(fid, '\n');
end

end