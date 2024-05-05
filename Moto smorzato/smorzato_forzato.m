% Time
t = linspace(0, 10*pi, 1000); %time from 0 to 10pi

%dumped sine
A=0.168;
B=0.0445;
w=3.33;
phi=-3.68;
C=0.424;
Damped_sine = A * exp((-B*t)).* sin(w*t + phi)+C;
Linear_sine = (A/40)*(45.5-(1.45)*t).*sin(w*t+phi)+C-0.01;

plot(t,Linear_sine,'LineWidth',2);
hold on

decSUP = A*exp((-B*t))+C;
hold on
decINF = -A*exp((-B*t))+C;
hold on

y = [0.6,0.583,0.573,0.563,0.55];
x = [1.5,3.5,5.3,7.25,9.3];

y1 = [0.245,0.254,0.266,0.278,0.289];
x1 = [2.5,4.5,6.3,8.2,10.01];

%sup line linear regression
coefficients = polyfit(x, y, 1); 

m = coefficients(1); 
q = coefficients(2);

disp(["Angular coefficient of sup. line: ", m, "q sup. line: ", q]);

x_min = min(x) - 1 * (max(x) - min(x)); % Extendending of 0.1 over the maximum
x_max = max(x) + 3 * (max(x) - min(x)); 

x_fit = linspace(x_min, x_max, 100);

y_fit = m * x_fit + q;

% Plot
plot(x, y, 'o', 'MarkerSize', 8, 'MarkerFaceColor', "#4DBEEE"); % Experimental datas

plot(x_fit, y_fit, 'r-', 'LineWidth', 2, 'Color', "#77AC30"); % line


legend('','Punti di Massimo','Rette di Regressione','Location', 'northeast');

%Inf. line linear regression
coefficients = polyfit(x1, y1, 1);

m = coefficients(1); 
q = coefficients(2); 

disp(["Angular coefficient of inf. line: ", m, "q inf. line: ", q]);

x1_min = min(x1) - 1 * (max(x1) - min(x1));
x1_max = max(x1) + 3 * (max(x1) - min(x1)); 

x_fit = linspace(x1_min, x1_max, 100);

y_fit = m * x_fit + q;

plot(x1, y1, 'o', 'MarkerSize', 8, 'MarkerFaceColor', "#4DBEEE"); %Experimental datas
hold on;
plot(x_fit, y_fit, 'r-', 'LineWidth', 2, 'Color', "#77AC30"); %regression line
hold off;


legend('','Minimum and Maximum Points','Linear regression line','Location', 'northeast');

xlabel('Time  t [s]');
ylabel('displacement from the stable position [m]');
title('Damped motion graph');
grid on;


