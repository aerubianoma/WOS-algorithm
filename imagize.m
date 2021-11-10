clear all
% # Points in the boundary
N = 1000;
% Domain of the boundary
t_parameter = linspace(-pi,pi,N)';
% Boundary components
Bdry_x = 4*sin(t_parameter);
Bdry_y = cos(t_parameter);
x_max = findpeaks(Bdry_x)
x_min = min(Bdry_x)
y_max = findpeaks(Bdry_y)
y_min = min(Bdry_y)
% Boundary
Bdry = [Bdry_x,Bdry_y];
% Plot boundary
plot(Bdry_x,Bdry_y,'color','green')
w = 256
h = 512
hold on
axis equal
grid on
for i = 0:w
    for j= 0:h
        plot(x_min*i/w+(1-i/w)*x_max,y_min*j/h+(1-j/h)*y_max,'.','color','red')
    end
end
