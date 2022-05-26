function [Theta1 Theta2] = roll(nn_params, _size)

% Get size of model
input = _size('input');
hidden = _size('hidden');
output = _size('output');

% Reshape nn_params to thetas
Theta1 = reshape(nn_params(1:hidden*(input+1)), hidden, (input+1));
Theta2 = reshape(nn_params((1+(hidden*(input+1))):end), output, (hidden+1));
end
