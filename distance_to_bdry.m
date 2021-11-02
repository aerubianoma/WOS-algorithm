
function [mind,flag]= distance_to_bdry(cp,Bdry)

flag=0;
start_bdr_point=Bdry(1,:);
n=length(Bdry);
for i=1:n
  distances_to_all_points(i)=norm( cp-Bdry(i,:));
  inner_product_with_all_points(i)=dot(Bdry(i,:)-cp, start_bdr_point);
end


mind=min(distances_to_all_points);


if (min(inner_product_with_all_points)<-0.0001 && max(inner_product_with_all_points)>0.0001)
  flag=1;
end

end
