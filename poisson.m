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
sum = 0;
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
      inner_radius = radius*sqrt(rand);
      % Plot the circle and choose the point that we take randomly in it
      circle(current_point(1),current_point(2),radius);
      % Random direction to the next point
      random_angle = rand;
      inner_random_angle = rand;
      random_direction = [sin(2*pi*random_angle) , cos(2*pi*random_angle)];
      inner_random_direction = [sin(2*pi*inner_random_angle) , cos(2*pi*inner_random_angle)];
      % Choose a random point in the circle
      next_point = current_point + (radius*random_direction);
      inner_point = current_point + (inner_radius*inner_random_direction);
      plot(next_point(1),next_point(2),'.','color','red')
      plot(inner_point(1),inner_point(2),'.','color','yellow')
      % Update the distance of the current point to the boundary
      current_distance = distance_to_bdry(next_point,Bdry);
      % Update the point
      sum = sum + pi*radius*radius*f(inner_point)*green_function(radius,inner_radius);
      current_point = next_point;
      pause(0.5)
    end
    % Update the estimator
    sum = sum + g(current_point); 
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
solution_at_current_point = sum / number_of_paths