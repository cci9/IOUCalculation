function [sol] = intersection_check(a1,b1,a2,b2,a3,b3,a4,b4)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A=[(b2-b1) -(a2-a1); (b4-b3) -(a4-a3)];
B=[a1*(b2-b1)-b1*(a2-a1); a3*(b4-b3)-b3*(a4-a3)];
sol= inv(A)*B;
end

