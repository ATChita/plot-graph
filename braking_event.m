%%Program for plot graph while driving and braking event
%%The data x, y,z is the acceleration
%%Magnitude is the total of three accelerations
%%program by AT Chita

clc
clear

%Read data from Excel file
my = xlsread('result_testing.xlsx', 'Sheet1','F4:H608');

X = my(:,1);%x-axis
Y = my(:,2);%y-axis
Z = my(:,3);%z-axis

Magnitude = sqrt(X.^2+Y.^2+Z.^2);%vector of three axis
t = linspace(0,60,length(my));
[maxValue, maxIndex] = max(Magnitude); % find maximum value and its index

% % Create a figure
figure(6)

% Define positions for each subplot [left, bottom, width, height]
pos1 = [0.5, 0.1, 0.01, 10]; % Position for the x-axis subplot
pos2 = [0.5, 0.1, 0.01, 10];  % Position for the y-axis subplot
pos3 = [0.5, 0.1, 0.01, 10]; % Position for the z-axis subplot
pos4 = [0.5, 0.1, 0.01, 10];  % Position for the magnitude subplot

%plot x-axis
f1 = subplot(4,1,1);
plot(t,X,'r')
title('X-axis Acceleration');
%xlabel('Time(s)');
ylabel('Acceleration(g)')
legend('X','Location','best')

%plot y-axis
subplot(4,1,2);
plot(t,Y,'r')
title('Y-axis Acceleration');
%xlabel('Time(s)');
ylabel('Acceleration(g)')
legend('Y','r')

%plot z-axis
subplot(4,1,3);
plot(t,Z,'r')
title('Z-axis Acceleration');
%xlabel('time(s)');
ylabel('Acceleration(g)')
legend('Z','r')

%ploat graph vetor
subplot(4,1,4);
%plot(t,Magnitude,'r')
plot(t, Magnitude, 'r', 'DisplayName', 'Magnitude');
hold on;

%plot the maximum value as a horizontal line
plot(t, maxValue*ones(size(t)), '--b', 'DisplayName', 'Max Line');

%Highlight the exact maximum point
plot(t(maxIndex), maxValue, 'bo', 'MarkerSize', 8, 'DisplayName', 'Max Point'); % Mark the maximum value
text(t(maxIndex), maxValue, sprintf(' Max: %.4f g', maxValue), ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
title('Acceleration Manitude');
xlabel('Time(s)');
ylabel('Acceleration(g)')
legend('Magnitude','max','Location','best')
%xlim([0 60]); % Set x-axis limit from 0 to 60
%ylim([0 2.5]); % Set y-axis limit from 0 to 2.5
hold off