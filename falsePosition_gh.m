%% Lucas Higgins
% MECH 105: Homework 11
% False Position 
function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
% The function 'falsePosition' give a function's root
%   The function 'falsePosition' works by giving a function with upper and lower bounds that
%   bracket the zero. 
%   First input: func - the function being evaluated
%   Second input: xl - the lower guess
%   Third input: xu - the upper guess
%   Fourth input: es - the desired relative error (default is .0001%)
%   Fifth iput: maxiter - the number of iterations desired (default is 200)

% The function 'falsePosition' has four outputs
%   First output: root - the estimated root location
%   Second output: fx - the function evaluated at the root location
%   Third output: ea - the approximate relative error
%   Fourth output: iter - how many iterations were performed 

% Make sure the upper bound is larger than the lower bound

if xu<=xl
    error ('The upper bound must be larger than the lower bound')
end
% If the user doesn't input the number of iterations, default to 200

if nargin==4
    maxiter=200;
    
    % If the user doesn't input the number of iterations and relative error, 
    % default to 200 and .0001%
    
elseif nargin==3
    maxiter=200;
    es=.0001;
end

% Prior to the loop, make sure iter, ea, and root all start at 0

iter=0;
ea=Inf;
root=0;
while ea>es && maxiter>iter
    iter=iter+1;
    prev_root=root;
   
    % Find the y value of the upper and lower bounds as well as the root
fxu=subs(func,xu);

fxl=subs(func,xl);

root=xu-(((fxu)*(xl-xu))/(fxl-fxu));

fx=subs(func,root);

% If the the y value of both bounds have the same sign, choose a new
% bracket

if sign(fxu)==sign(fxl)
    error ('Set a different bracket')
end

    % If the y value of the root has the same sign as the upper bound,
    % make the root the new upper bound
    
    if sign (fx)==sign(fxu)
        xu=root;
        
    % If the y value of the root has the same sign as the lower bound, 
    % make the root the new lower bound
    
    elseif sign(fx)==sign(fxl)
        xl=root;
    end
    
    % Find the approximate relative error 
    
    ea=(abs((root-prev_root)/root))*100;
end

% Display the four outputs for the user

fprintf('The estimate root location %.9f\n', root)
fprintf('The function evaluated at the root location %.9f\n', fx)
fprintf('The approximate relative error %.e\n', ea)
fprintf('How many iterations were performed %.f\n', iter)
end

