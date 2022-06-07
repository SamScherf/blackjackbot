function [_size] = get_size(input, hidden, output)
% This function gets the size of the model
	_size = containers.Map('KeyType','char','ValueType','int32');
	_size('input') = 26;
	_size('hidden1') = 2;
	_size('hidden2') = 8;
	_size('output') = 1;
end
