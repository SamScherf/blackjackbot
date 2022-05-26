function [anw] = sigmoidGradient(z)
	anw = sigmoid(z).*(1-sigmoid(z));
end
