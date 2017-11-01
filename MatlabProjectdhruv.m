syms x y lam real;
f=input('Enter the total salary paid by the company in terms of two variables i.e. x and y')
display('where x is the worst rating of the company in a month out of 100')
display('and y is the best rating of the company in a month out of 100)')
g=y-x-25

[alam,ax,ay]=solve(jacobian(f-lam*g,[x y lam]))
T=subs(f,{x,y},{ax,ay})
for i=1:1:size(T)
    sprintf('The value of the worst rating the company can have is %d',double(ax(i)))
    sprintf('The value of the best rating the company can have is %d',double(ay(i)))
    sprintf('The min value of the total salary to be paid to the employees is %d',double(T(i)))
end
