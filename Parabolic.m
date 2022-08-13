clc
clear all
x0 = 0.1;
x1 = 0.5;
x2 = 5;
f = @(x) 2*x+(3/x) ;
iter = 10;
i = 1;
f0 = f(x0);
f1 = f(x1);
f2 = f(x2);
x3 = f0*(x1^2 - x2^2) + f1*(x2^2 - x0^2) + f2*(x0^2 - x1^2);
x3 = x3/(2*f0 * (x1 - x2) + 2 * f1 * (x2 - x0) + 2*f2*(x0-x1));
f3 = f(x3);

ivec = {'Iteration'};
ivec = [ivec i];
x0vec = {'x0'};
x0vec = [x0vec x0];
fx0vec = {'f(x0)'};
fx0vec = [fx0vec f(x0)];
x1vec = {'x1'};
x1vec = [x1vec x1];
fx1vec = {'f(x1)'};
fx1vec = [fx1vec f(x1)];
x2vec = {'x2'};
x2vec = [x2vec x2];
fx2vec = {'f(x2)'};
fx2vec = [fx2vec f(x2)];
x3vec = {'x3'};
x3vec = [x3vec x3];
fx3vec = {'f(x3)'};
fx3vec = [fx3vec f(x3)];
evec = {'error(%)'};
evec = [evec 'n/a'];
for i = 2 : iter+1
    if x3 > x1 
        x0 = x1;
        x1 = x3;
        x2 = x2;
    else
        x2 = x1;
        x1 = x3;
        x0 = x0;
    end
    
    f0 = f(x0);
    f1 = f(x1);
    f2 = f(x2);
    x3old = x3;
    x3 = f0*(x1^2 - x2^2) + f1*(x2^2 - x0^2) + f2*(x0^2 - x1^2);
    x3 = x3/(2*f0 * (x1 - x2) + 2 * f1 * (x2 - x0) + 2*f2*(x0-x1));
    f3 = f(x3);
    error = ((abs(x3-x3old))/x3)*100;

ivec = [ivec i];
x0vec = [x0vec x0];
fx0vec = [fx0vec f0];
x1vec = [x1vec x1];
fx1vec = [fx1vec f1];
x2vec = [x2vec x2];
fx2vec = [fx2vec f2];
x3vec = [x3vec x3];
fx3vec = [fx3vec f3];
evec = [evec error];
i = i + 1;

end
%Print the table
ivec = ivec';
x0vec = x0vec';
x1vec = x1vec';
x2vec = x2vec';
x3vec = x3vec';
fx0vec = fx0vec';
fx1vec = fx1vec';
fx2vec = fx2vec';
fx3vec = fx3vec';
evec = evec';
T = [ivec x0vec fx0vec x1vec fx1vec x2vec fx2vec x3vec fx3vec evec]
%Answers
xval = x3
yval = f(x3)