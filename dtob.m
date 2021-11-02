
function mind= dtob(x,Bdry)


n=length(Bdry);
for i=1:n
  d(i)=norm( x-Bdry(i,:));
endfor

mind=min(d);

endfunction
