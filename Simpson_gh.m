%% Lucas Higgins
% MECH 105: Homework 19
% Simpson's 1/3 Algorithm
%
%
% To run, create a column vector named 'x' and a column vector named 'y'.
% Ex: Simpson (x,y);
%
%
function [I] = Simpson (x,y)


% The function Simpson takes two inputs.
% The first input is the range of x values.
% The second input is a range of y values that corresponds to the x values.
% The number of x values should be the same as the number of y values.
% The function will use the Simpson's 1/3 method to integrate the values.
% If there is an odd amount of input values, the last increment will use a
% a single interation of the trapaziod method. 

% Check to make sure the user inputs 2 column vectors

if nargin < 2 || nargin > 2
    error('Enter both a range of x values and their corresponding y values')
end

% Check to make sure the user inputs equally long vectors

if length(x) ~= length(y)
    error('Enter the same amount of x and y values')
end

% Start by getting the size of the x vector

[n,m] = size (x);

% See if the user inputed an odd or even amount of values

ev_or_odd = mod(n,2);

% Depending on if the trapaziod method is needed, V and
% total_trap will be added at the end.

V = 0;

total_trap = 0;

% Make sure increment size is the same amongst x values.

for i = 1 : n-2
    
    value = x(i+1) - x(i);
    
    ii = i+1;
    
    next_value = x(ii+1) - x(ii);
    
    factor = next_value / value;
    
    if factor ~= 1
        error ('Enter x values with same incriment')
    end
    
end
    
    % This section is for an even number of inputs
    % Run through the Simpson's 1/3 method using the x and y values
    % previously inputted.  
    
    if ev_or_odd == 0;
        
        V = 0;
        
        for j = 1 : n-1
            
        old_I = (x(j+1) - x(j)) *  (( (y(j) + (4*((y(j)+y(j+1))/2)) + y(j+1)) / 6));
        
        V = V + old_I;
       
        end
        
    % This section is for an odd number of inputs
    % Run through the Simpson's 1/3 method using the x and y values
    % previously inputted.
    % This section will differ by using the trapaziod method the last increment.
    
    else ev_or_odd == 1; 
       
        V_trap = 0;
        
        for j = 1 : n-2
            
        old_I = (x(j+1) - x(j)) *  (( (y(j) + (4*((y(j)+y(j+1))/2)) + y(j+1)) / 6));
        
        V_trap = V_trap + old_I;
        
        end
     
    for jj = n-1 : n
        
        trap_I = (x(n) - x(n-1)) * ( (y(n) + y(n-1)) / 2 );
    end
    
    total_trap = V_trap + trap_I;
    end
 
    % Depending on which method was used, add zero and display the final I
    % value.
    
    I = V + total_trap;
  
    fprintf('I = \n')
    disp(I)
end





