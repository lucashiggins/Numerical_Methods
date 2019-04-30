%% Lucas Higgins
% Mech 105: Homework 16
% LU Decomposition
% 
%
% The only input for luFactor is the A matrix.
% The function luFactor will give you the lower triangle matrix (L),
% the upper triangle matrix (U), and the pivot matrix (P).
%
%

function [L, U, P] = luFactor (A)

% Declare n and m as the size of A

[n,m] = size(A);

% Start L matrix with an identity matrix based off the size of A.

L=eye(n);

% Start P matrix with an identity matrix based off the size of A.

P=eye(n);
 
% To find L and U matrix, go through each colum starting at column 1 and go
% to the nth column. Each time the for loop completes a loop, the
% coefficient used to eliminate the previous variable will be stored in the
% L matrix, and the remaining value for that variable will be stored in the
% A matrix. 

for i=1:n
     
  % Change the value of the L matrix based off the coefficent used to
  % eliminated each variable.
  
  
   L(i+1 : n,i) = A(i+1:n,i)/A(i,i);
   
   % Change the A matrix to leave the remaining values after eliminating
   % each variable. 
   
    for ii=i+1:n
        
    A(ii,:) = A(ii,:) - (L(ii,i) .* A(i,:));
    
    end
    
    % The entire time, the A matrix was being manipulated, so end by
    % referring to the new A matrix as the U matrix.
    
    U=A;
  
end
    
 fprintf('L Matrix = \n')
 disp(L)
 fprintf('U Matrix = \n')
 disp(U)
 fprintf('P Matrix = \n')
 disp(P)
end  


 
    
        
        
    


    
    