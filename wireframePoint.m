function [projectedPoint] = wireframePoint(eyeDistance, a)
    %plots a given point in 3d and also plots the projection onto a plane
    %with respect to an eye point defined by a given distance to the plane.
    %eyeDistance is that distance.

    projectionScalar = -eyeDistance ./ (-eyeDistance - a(1));

    projectedPoint = projectionScalar .* [0 a(2) a(3)];

    eyePoint = [-eyeDistance 0 0];

    [z, y] = meshgrid(-10:20:10); % Generate x and y data
    x = zeros(size(z, 1)); % Generate z data
    surf(x, y, z) % Plot the surface
    hold on


    plotPoint('rd', eyePoint)
    plotPoint('r.', a)
    plotPoint('r.', projectedPoint)

    axis([-10 10 -10 10 -10 10])


end