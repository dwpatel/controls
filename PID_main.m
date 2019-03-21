% Inspired by:
% UC Berkeley ME132 Spring 2016
% HW6

clear;
clc;

RF = rad2deg(0.5);
N = 5;

% K_P_vec = linspace(0,1,N);
K_P = 1;
% K_D_vec = linspace(0,1,N);
K_D = 0;
K_I_vec = linspace(0,1,N);
% K_I = 0;

sims = {};

% run simulation
for i = 1:N
    K_I = K_I_vec(i);
    sim('PID_sim');
    sims{i}.time = theta.time;
    sims{i}.theta = theta.signals.values;
    legendInfo{i} = ['KP = ',num2str(K_P), ', KI = ',num2str(K_I), ', KD = ',num2str(K_D)];
end

% plotting
figure();
hold on;
for i = 1:N
    plot(sims{i}.time,sims{i}.theta);
end
plot(ref.time, ref.signals.values,'LineWidth',2);
hold off;
legend(legendInfo);
xlabel('time');
ylabel('$$\theta(t)$$','Interpreter','Latex');


