function [anw] = sigmoid(z)
	anw = 1./(1+e.^(-z));
end
