%% Task 2.2
clear;
n_array = [200 200 400 400];
p_array = [200 200 1500 1500];
s_array = [0.5 0.9 0.5 0.99];
lambda = [0.001 0.002 0.005 0.008];
epsilon = 10 .^ [-7 -7 -7;-7 -7 -7;-1 -5 -5;-7 -5 -5];

for i = 1:4
    [y, X, w] = GenerateCorrData(n_array(i), p_array(i), s_array(i),0.4);
    if i==3||i==4
        w1=0;z1=1000000;t1=0;
    else
        [w1,z1,t1] = SubgradientSolver(X, y, lambda(i),200,120,epsilon(i,1));
    end
    [w2,z2,t2] = ProximalSolver(X, y, lambda(i),epsilon(i,2));
    [w3,z3,t3] = CoordinateDescentSolver(X, y, lambda(i),epsilon(i,3));
    % use min of three methods to approximate optimum.
    z_min = min([z1(end) z2(end) z3(end)]);

    figure(i);
    hold on
    plot(log(t1), log(z1-z_min), 'b', 'LineWidth', 2);
    plot(log(t2), log(z2-z_min), 'r', 'LineWidth', 2);
    plot(log(t3), log(z3-z_min), 'g', 'LineWidth', 2);
    xlabel('Log(cputime(s))');
    ylabel('Log(Distance)');
    title(['(n,p,s) = (' num2str(n_array(i)) ',' num2str(p_array(i)) ',' num2str(s_array(i)) ')  \lambda = ' num2str(lambda(i))]);
    legend('SGD', 'ISTA', 'CD');
    hold off
end