function projectedPoint =  projection(eyeDistance ,point) 
    %projection() calculates the coordinates of the projection of the input
    %point and creates a 3d space for the other programs to work in.
    
    projectionScalar = -eyeDistance ./ (-eyeDistance - point(1));
    projectedPoint = projectionScalar .* [0 point(2) point(3)];
    
    [z, y] = meshgrid(-10:20:10); % Generate x and y data
    x = zeros(size(z, 1)); % Generate z data
    surf(x, y, z) % Plot the surface
    axis([-10 10 -10 10 -10 10])
    hold on
    
    plotPoint('rd', [-eyeDistance 0 0])
    plotPoint('r.', point)
    plotPoint('r.', projectedPoint)
end