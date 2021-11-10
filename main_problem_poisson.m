clear all
% # Points in the boundary
N = 1000;
% Domain of the boundary
t_parameter = linspace(-pi,pi,N)';
% Boundary components
Bdry_x = cos(t_parameter).*(1-cos(t_parameter))+1;
Bdry_y = sin(t_parameter).*(1-cos(t_parameter));
% Values used to create the result
x_max = max(findpeaks(Bdry_x))
x_min = min(Bdry_x)
y_max = max(findpeaks(Bdry_y))
y_min = min(Bdry_y)
% Quality of the result
w = 10
h = 5
% Boundary
Bdry = [Bdry_x,Bdry_y];
% Plot boundary
plot(Bdry_x,Bdry_y,'color','green')
hold on
axis equal
grid on
% Initial Point
trial_point = [0,0];
% Number of paths
number_of_paths = 10;
% stop variable
e = 0.1;
result = zeros(w+1,h+1);
for i = 0:w
    for j= 0:h
        fprintf('Progress: \n')
        i
        j
        trial_point = [x_min*i/w+(1-i/w)*x_max,y_min*j/h+(1-j/h)*y_max];
        plot(x_min*i/w+(1-i/w)*x_max,y_min*j/h+(1-j/h)*y_max,'.','color','black')
        pause(0.0000001)
        if inside(trial_point,Bdry_x,Bdry_y) == 1
            result(i+1,j+1) = poisson(trial_point,Bdry,number_of_paths,e);
        end
    end
end
result = result
figure 
imagesc(result); 
colormap(gray)