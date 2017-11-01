%to demonstrate calculus in economics
clc;
syms x y z real; 
c=input('Enter the polynomial cost function in terms of x where x is the no. of articles:');
r=input('Enter the polynomial revenue function in terms of x where x is the no. of articles:');
x1=input('Enter the no. of articles:');
cx1=subs(c,x,x1);
rx1=subs(r,x,x1);
res=rx1-cx1;
mc=diff(c,x);
ac=c/x;
mr=diff(r,x);
ar=r/x;
lc=limit(c,x,x1);
lr=limit(r,x,x1);
mcv=subs(mc,x,x1);
mrv=subs(mr,x,x1);
acv=subs(ac,x,x1);
arv=subs(ar,x,x1);
tc=mcv*(x-x1)+cx1;
tr=mrv*(x-x1)+rx1;
bep=real(solve(c-r));
ccp=real(solve(mc));
rcp=real(solve(mr));
mmc=diff(mc,x);
mmr=diff(mr,x);

figure;
hold on;
fprintf('The cost function is given in the figure window.\n');
ezplot(c,[0,x1+25]);
xlabel('No. of articles');
ylabel('Cost');
pause;
fprintf('The cost point corresponding to the no. of articles entered is (%f,%f).\n',double(x1),double(cx1));
plot(double(x1),double(cx1),'r:*');
pause;
fprintf('The limiting cost point corresponding to the no. of articles entered is (%f,%f).\n',double(x1),double(lc));
plot(double(x1),double(lc),'g:*');
pause;
fprintf('The tangent at the cost point is given in the figure window.\n');
t1=ezplot(tc,[0,x1+25]);
set(t1,'color','red');
hold off;
pause;
figure;
hold on;
fprintf('The marginal cost is given in the figure window.\n');
ezplot(mc,[0,x1+25]);
xlabel('No. of articles');
ylabel('Marginal cost');
pause;
fprintf('The marginal cost point corresponding to the no. of articles entered is (%f,%f).\n',double(x1),double(mcv));
plot(double(x1),double(mcv),'b:*');
pause;
hold off;
fprintf('The average cost is given in the figure window.\n');
figure;
hold on;
ezplot(ac,[0,x1+25]);
xlabel('No. of articles');
ylabel('Average cost');
pause;
fprintf('The average cost point corresponding to the no. of articles entered is (%f,%f).\n',double(x1),double(acv));
plot(double(x1),double(acv),'y:*');
pause;
hold off;

figure;
hold on;
fprintf('The revenue function is given in the figure window.\n');
ezplot(r,[0,x1+25]);
xlabel('No. of articles');
ylabel('Revenue');
pause;
fprintf('The revenue point corresponding to the no. of articles entered is (%f,%f).\n',double(x1),double(rx1));
plot(double(x1),double(rx1),'r:*');
pause;
fprintf('The limiting revenue point corresponding to the no. of articles entered is (%f,%f).\n',double(x1),double(lr));
plot(double(x1),double(lr),'g:*');
pause;
fprintf('The tangent at the revenue point is given in the figure window.\n');
t2=ezplot(tr,[0,x1+25]);
set(t2,'color','red');
hold off;
pause;
figure;
hold on;
fprintf('The marginal revenue is given in the figure window.\n');
ezplot(mr,[0,x1+25]);
xlabel('No. of articles');
ylabel('Marginal revenue');
pause;
fprintf('The marginal revenue point corresponding to the no. of articles entered is (%f,%f).\n',double(x1),double(mrv));
plot(double(x1),double(mrv),'b:*');
pause;
hold off;
fprintf('The average revenue is given in the figure window.\n');
figure;
hold on;
ezplot(ar,[0,x1+25]);
xlabel('No. of articles');
ylabel('Average revenue');
pause;
fprintf('The average revenue point corresponding to the no. of articles entered is (%f,%f).\n',double(x1),double(arv));
plot(double(x1),double(arv),'y:*');
pause;
hold off;

figure;
ezplot(c,[0,x1+25]);
xlabel('No. of articles');
ylabel('Cost');
for i=1:1:size(ccp);
    d2=subs(mmc,x,ccp(i));
    ccpv=subs(c,x,ccp(i));
    if(d2==0);
        fprintf('The point (%f,%d) is cost inflexion point.\n',double(ccp(i)),double(ccpv));
    end;
    if(d2<0);
        fprintf('The point (%f,%f) is cost point of maxima.\n',double(ccp(i)),double(ccpv));
    end;
    if(d2>0);
        fprintf('The point (%f,%f) is cost point of minima.\n',double(ccp(i)),double(ccpv));
    end;
    hold on;
    plot(double(ccp(i)),double(ccpv),'r:+');
    pause;
end;
hold off;

figure;
ezplot(r,[0,x1+25]);
xlabel('No. of articles');
ylabel('Revenue');
for i=1:1:size(rcp);
    d2=subs(mmr,x,rcp(i));
    rcpv=subs(r,x,rcp(i));
    if(d2==0);
        fprintf('The point (%d,%d) is revenue inflexion point.\n',double(rcp(i)),double(rcpv));
    end
    if(d2<0);
        fprintf('The point (%d,%d) is revenue point of maxima.\n',double(rcp(i)),double(rcpv));
    end
    if(d2>0);
        fprintf('The point (%d,%d) is revenue point of minima.\n',double(rcp(i)),double(rcpv));
    end
    hold on;
    plot(double(rcp(i)),double(rcpv),'r:+');
    pause;
end
hold off;

if(res>0);
    fprintf('The profit obtained on selling %d articles is %f.\n',x1,double(res));
elseif(res<0);
    fprintf('The loss obtained on selling %d articles is %f.\n',x1,-1*double(res));
else
    fprintf('Neither profit nor loss is obtained on selling %d articles.\n',x1);
end;
        
figure;
xlabel('No. of articles');
g1=ezplot(c,[0,x1+25]);
set(g1,'color','green');
hold on
g2=ezplot(r,[0,x1+25]);
set(g2,'color','blue');
for i=1:1:size(bep);
    fprintf('The break even point is (%f,%f).After this point either profit or loss occurs.\n',double(bep(i)),double(subs(c,x,double(bep(i)))));
    plot(double(bep(i)),double(subs(c,x,double(bep(i)))),'r:*');
    pause;
end
hold off;

f=input('Enter the total amount of salary that needs to be given to the employees in terms of x and y where x represents the total funds of the company and y represents the total money spent for office maintenance and employee facilities:');
fx=diff(f,x);
fy=diff(f,y);
[ax,ay]=solve(fx,fy);
fxx=diff(fx,x);
fxy=diff(fx,y);
fyy=diff(fy,y);
D=fxx*fyy-(fxy)^2;
for i=1:1:size(ax)
    T1=subs(subs(D,x,ax(i)),y,ay(i));
    T2=subs(subs(fxx,x,ax(i)),y,ay(i));
    T3=subs(subs(f,x,ax(i)),y,ay(i));
    if(double(T1)>0)
        if(double(T2)<0)
            fprintf('If the boss is happy,the maximum amount of salary that is to be given to the employees is %f rupees.\n',double(T3));
        end
        if(double(T2)>0)
            fprintf('If the boss is disappointed,the minimum amount of salary that is to be given to the employees is %f rupees.\n',double(T3));
        end
        if(double(T2)~=0)
            figure;
            fprintf('The given function is plotted in the figure window.\n');
            ezsurf(f,[double(ax(i))-2,double(ax(i))+2,double(ay(i))-2,double(ay(i))+2]);
            xlabel('Total funds');
            ylabel('Money spent for office maintenance and employee facilities');
            zlabel('Total amount of salary that needs to be given to the employees');
            hold on;
            fprintf('The salary to be given is plotted in the figure window.\n'); 
            plot3(double(ax(i)),double(ay(i)),double(T3),'r*','markersize',15);
        end   
    end
end