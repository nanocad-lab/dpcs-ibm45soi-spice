% Author: Mark Gottscho
% mgottscho@ucla.edu

ls_remainder = ls('processed-out');
string_cell_array = {};

i = 1;
while (size(ls_remainder,2) > 0)
   [single_filename, ls_remainder] = strtok(ls_remainder);
   string_cell_array{i} = single_filename;
   i = i + 1;
end

input_csv_filenames = {};
for i = 1:size(string_cell_array,2)-1
   input_csv_filenames{i} = string_cell_array{1,i};  
end

input_csv_filenames = sort(input_csv_filenames);

clear i;
clear string_cell_array;
clear ls_remainder;
clear single_filename;

mkdir final-out
fet_iv = aggregate_csv_results('processed-out', input_csv_filenames, 'final-out', 'aggregated_results.csv', 101);
