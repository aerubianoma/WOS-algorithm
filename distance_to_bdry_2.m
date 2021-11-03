% In this function we compute the distance to the point cp to all the points
% in the boundary and we take the min as the radius of our circle
function mind = distance_to_bdry_2(cp , Bdry)
start_bdr_point = Bdry(1,:);
n = length(Bdry);
for i = 1:n
  distances_to_all_points(i) = norm(cp-Bdry(i,:));
  inner_product_with_all_points(i) = dot(Bdry(i,:)-cp , start_bdr_point);
end
mind = min(distances_to_all_points);
