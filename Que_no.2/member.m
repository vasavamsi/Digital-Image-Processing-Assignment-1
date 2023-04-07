function y = member(a,b)
y = 0;
for i = 1: length(b)
    if b(i) == a
        y = 1;
        break
    end
end

        

