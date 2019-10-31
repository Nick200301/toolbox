function plotPoint(style, a)
    %Expects a style argument used for the plot function and a 1x3 array that represents a point in 3D
    %plotPoint() plots the point a with the given style in 3D
    
    plot3(a(1), a(2), a(3), style)
    hold on
end