function time=calc(array)

sz = size(array);
time = 0;

for x = 1 : sz(1,2)
 time = time + array(x);
end