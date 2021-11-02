clear all
N=1000;
t_parameter=linspace(-pi,pi,N)';

Bdry_x=sin(t_parameter);
Bdry_y=4*cos(t_parameter);

Bdry= [Bdry_x,Bdry_y];
plot(Bdry_x,Bdry_y)
hold on
axis equal
grid on

trial_point=[0,0];
[inicial_distance, flag]=distance_to_bdry(trial_point,Bdry);
sum_of_g_values=0;
number_of_paths=100;



if (flag==0)
  print('Error')
else
  for sample=1:number_of_paths
    current_point=trial_point;
    current_path=[current_point];
    current_distance=inicial_distance;
    vector_of_distances=[current_distance];
    while( current_distance>0.1 )
      print('first while')
      radius=current_distance;
      random_angle=rand;
      random_direction=[sin(2*pi*random_angle),cos(2*pi*random_angle)];
      next_point=current_point+radius*random_direction;
      [current_distance,flag]=distance_to_bdry(next_point,Bdry);
      while (flag ==0 )
        print('out')
        radius=radius/2;
        next_point=current_point+radius*random_direction;
        [current_distance,flag]=distance_to_bdry(next_point,Bdry);
      end
      current_point=next_point;
      current_path=[current_path;current_point];
      vector_of_distances=[vector_of_distances;current_distance];
      plot(current_path(:,1),current_path(:,2));
      hold on
      sum_of_g_values=sum_of_g_values+bdry_data(current_point);
      pause(0.1)
    end
  end
end
solution_at_current_point= sum_of_g_values/number_of_paths