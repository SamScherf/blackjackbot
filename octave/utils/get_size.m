function [_size] = get_size(input, hidden, output)
% This function gets the size of the model
	_size = containers.Map('KeyType','char','ValueType','int32');
	_size('input') = 26;
	_size('hidden') = 10;
	_size('output') = 1;
end
