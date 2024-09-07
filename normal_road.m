%%Program for plot graph while driving on the Normal road
%%The data x, y,z is the acceleration
%%Magnitude is the total of three accelerations
%%program by AT Chita

clc;
clear;
my = xlsread('result_testing.xlsx', 'Sheet1','A4:C593');
X = my(:,1);%x-axis
Y = my(:,2);%y-axis
Z = my(:,3);%z-axis
Magnitude = sqrt(X.^2+Y.^2+Z.^2);%vector of three axis
t = linspace(0,60,length(my));%time 60 seconds
[maxValue, maxIndex] = max(Magnitude); % find maximum value and its index

%Create Figure
figure(5)

% Define positions for each subplot [left, bottom, width, height]
pos1 = [0.5, 0.1, 0.01, 10]; % Position for the x-axis subplot
pos2 = [0.5, 0.1, 0.01, 10];  % Position for the y-axis subplot
pos3 = [0.5, 0.1, 0.01, 10]; % Position for the z-axis subplot
pos4 = [0.5, 0.1, 0.01, 10];  % Position for the magnitude subplot

%plot x-axis
subplot(4,1,1);
plot(t,X,'r')
title('X-axis Acceleration');
%xlabel('Time(s)');
ylabel('Acceleration(g)')
legend('X','Location','best')

%plot y-axis
subplot(4,1,2);
plot(t,Y,'r')
title('y-axis Acceleration');
%xlabel('Time(s)');
ylabel('Acceleration(g)')
legend('Y','Location','best')

%plot z-axis
subplot(4,1,3);
plot(t,Z,'r')
title('Z-axis Acceleration');
%xlabel('Time(s)');
ylabel('Acceleration(g)')
legend('z','Location', 'best')

%ploat graph vetor
subplot(4,1,4);
%plot(t,Magnitude,'r')
plot(t, Magnitude, 'r', 'DisplayName', 'Magnitude');
hold on;

%plot the maximum value as a horizontal line
plot(t, maxValue*ones(size(t)), '--b', 'DisplayName', 'Max Line');

%Highlight the exact maximum point
plot(t(maxIndex), maxValue, 'bo', 'MarkerSize', 8, 'DisplayName', 'Max Point'); % Mark the maximum value
text(t(maxIndex), maxValue, sprintf(' Max: %.4f g', maxValue,'fontsize','12'), ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');

title('Acceleration Manitude');
xlabel('time(s)');
ylabel('Acceleration(g)')
legend('Magnitude','Location','best')
legend('maxValue', 'Location','best')
% xlim([0 60]); % Set x-axis limit from 0 to 60
ylim([0 2.1]); % Set y-axis limit from 0 to 2.1
hold off