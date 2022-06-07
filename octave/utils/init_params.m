function [nn_params] = init_params(_size)

% Initialize weight randomly
Theta1 = randInitializeWeights(_size('input'), _size('hidden1'));
Theta2 = randInitializeWeights(_size('hidden1'),_size('hidden2'));
Theta3 = randInitializeWeights(_size('hidden2'),_size('output'));

% Unroll parameters
nn_params = [Theta1(:) ; Theta2(:) ; Theta3(:)];

end
