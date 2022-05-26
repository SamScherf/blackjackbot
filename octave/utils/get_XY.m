function [X Y] = get_XY(file_path)
	data = dlmread(file_path, ",");
	X = data(:, 1:end-1);
	Y = data(:, end);
end
