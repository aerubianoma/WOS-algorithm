clear all
% # Points in the boundary
N = 1000;
% Domain of the boundary
t_parameter = linspace(-pi,pi,N)';
% Boundary components
Bdry_x = sin(t_parameter);
Bdry_y = 4*cos(t_parameter);
% Boundary
Bdry = [Bdry_x,Bdry_y];
% Plot boundary
plot(Bdry_x,Bdry_y,'color','green')
hold on
axis equal
grid on
% Initial Point
trial_point = [0,0];
initial_distance = distance_to_bdry_2(trial_point,Bdry);
% Estimator for our solution
sum_of_g_values = 0;
% Number of paths
number_of_paths = 10;
% stop variable
e = 0.1
% We iterate in the number of paths
for path = 1:number_of_paths
    fprintf('Path number: \n')
    path
    % Initialize the process in the initial point and compute the initial
    % distance
    current_point = trial_point;
    current_distance = initial_distance;
    while( current_distance > e )
      % Use the distance to the boundary as the radius of the circle
      radius = current_distance;
      % Plot the circle and choose the point that we take randomly in it
      circle(current_point(1),current_point(2),radius)
      % Random direction to the next point
      random_angle = rand;
      random_direction = [sin(2*pi*random_angle) , cos(2*pi*random_angle)];
      % Choose a random point in the circle
      next_point = current_point + (radius*random_direction);
      plot(next_point(1),next_point(2),'.','color','red')
      % Update the distance of the current point to the boundary
      current_distance = distance_to_bdry(next_point,Bdry);
      % Update the point
      current_point = next_point;
      pause(0.5)
    end
    % Update the estimator
    sum_of_g_values = sum_of_g_values + g(current_point) 
    % Plot the last point of the random walk
    plot(current_point(1),current_point(2),'.','color','magenta')
    % Reset the plot
    clf reset
    plot(Bdry_x,Bdry_y,'color','green')
    hold on
    axis equal
    grid on
end
% Solution in the trial point
solution_at_current_point = sum_of_g_values/number_of_paths