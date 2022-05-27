function [nn_params] = init_params(_size)

% Initialize weight randomly
Theta1 = randInitializeWeights(_size('input'), _size('hidden'));
Theta2 = randInitializeWeights(_size('hidden'),_size('output'));

% Unroll parameters
nn_params = [Theta1(:) ; Theta2(:)];

end
