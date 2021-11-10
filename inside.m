function value = inside(point,Bdry_x,Bdry_y)
value = inpolygon(point(1),point(2),Bdry_x,Bdry_y);
end
