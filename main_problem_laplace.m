clear all
% # Points in the boundary
N = 1000;
% Domain of the boundary
t_parameter = linspace(-pi,pi,N)';
% Boundary components
Bdry_x = 4*sin(t_parameter);
Bdry_y = cos(t_parameter);
% Values used to create the result
x_max = findpeaks(Bdry_x)
x_min = min(Bdry_x)
y_max = findpeaks(Bdry_y)
y_min = min(Bdry_y)
% Quality of the result
w = 25
h = 10
% Boundary
Bdry = [Bdry_x,Bdry_y];
% Plot boundary
plot(Bdry_x,Bdry_y,'color','green')
hold on
axis equal
grid on
% Number of paths
number_of_paths = 10;
% stop variable
e = 0.1;
result = zeros(h+1,w+1);
correct = zeros(h+1,w+1);
for i = 0:w
    for j= 0:h
        fprintf('Progress: \n')
        i
        j
        trial_point = [x_min*(1-i/w)+i/w*x_max,y_min*j/h+(1-j/h)*y_max];
        plot(x_min*(1-i/w)+i/w*x_max,y_min*j/h+(1-j/h)*y_max,'.','color','black')
        pause(0.0000001)
        if inside(trial_point,Bdry_x,Bdry_y) == 1
            result(j+1,i+1) = laplace(trial_point,Bdry,number_of_paths,e);
            correct(j+1,i+1) = u_laplace(trial_point);
            result
        end
    end
end
result = result;
figure 
imagesc(result); 
colormap(gray)
figure
imagesc(correct); 
colormap(gray)
err = immse(result, correct); fprintf('\n The mean-squared error is %0.4f\n', err);
