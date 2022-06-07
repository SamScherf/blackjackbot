function [Theta1 Theta2 Theta3] = roll(nn_params, _size)

% Get size of model
input = _size('input');
hidden1 = _size('hidden1');
hidden2 = _size('hidden2');
output = _size('output');

% Set start and end values for each theta
t1_start = 1;
t1_end = hidden1*(input+1);
t2_start = 1+t1_end;
t2_end = t1_end + hidden2*(hidden1+1);
t3_start = 1+t2_end;

% Get Thetas
Theta1 = reshape(nn_params(t1_start:t1_end), hidden1, (input+1));
Theta2 = reshape(nn_params(t2_start:t2_end), hidden2, (hidden1+1));
Theta3 = reshape(nn_params(t3_start:end), output, (hidden2+1));

end
