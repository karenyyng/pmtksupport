% 
% Usage:   alpha=mexCD(X,D,alpha0,param);
%
% Name: mexCD
%
% Description: mexCD addresses l1-decomposition problem with a 
%     coordinate descent type of approach.
%     It is optimized for solving a large number of small or medium-sized 
%     decomposition problem (and not for a single large one).
%     It first computes the Gram matrix D'D.
%     This method is particularly well adapted when there is low 
%     correlation between the dictionary elements and when one can benefit 
%     from a warm restart.
%     It aims at addressing the two following problems
%     for all columns x_i of X, 
%       2) when param.mode=1
%         min_{alpha_i} ||alpha_i||_1 s.t. ||x_i-Dalpha_i||_2^2 <= lambda
%         For this constraint setting, the method solves a sequence of 
%         penalized problems (corresponding to param.mode=2) and looks
%         for the corresponding Lagrange multplier with a simple but
%         efficient heuristic.
%       3) when param.mode=2
%         min_{alpha_i} 0.5||x_i-Dalpha_i||_2^2 + lambda||alpha_i||_1 
%
% Inputs: X:  double m x n matrix   (input signals)
%               m is the signal size
%               n is the number of signals to decompose
%         D:  double m x p matrix   (dictionary)
%               p is the number of elements in the dictionary
%               All the columns of D should have unit-norm !
%         alpha0:  double sparse p x n matrix   (initial guess)
%         param: struct
%            param.lambda  (parameter)
%            param.mode (optional, see above, by default 2)
%            param.numThreads (optional, number of threads for exploiting
%            multi-core / multi-cpus. By default, it takes the value -1,
%            which automatically selects all the available CPUs/cores).
%
% Output: alpha: double sparse p x n matrix (output coefficients)
%
% Note: this function admits a few experimental usages, which have not
%     been extensively tested:
%         - single precision setting (even though the output alpha 
%           is double precision)
%
% Author: Julien Mairal, 2009


