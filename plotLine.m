function plotLine(a, b)
    %Expects two 1x3 arrays that represent two points in 3D
    %plotLine() plots a line between point a and b.
    
    plot3([a(1) b(1)], [a(2) b(2)], [a(3) b(3)])
    hold on
end