function projectedPoint =  projection(eyeDistance ,point)
    %Expects a distance for the viewpoint, called eyeDistance, from the
    %yz-plane and a 1x3 array that represents a point in 3D.
    %projection() calculates the coordinates of the projection of the input
    %point with respect to the viewpoint, which is defined by the
    %eyeDistance parameter and creates a 3d space with a
    %viewing plane for the other programs to work in.
    
    projectionScalar = -eyeDistance ./ (-eyeDistance - point(1));
    projectedPoint = projectionScalar .* [0 point(2) point(3)];
    
    x = [0 0 0 0];
    y = [-10 10 10 -10];
    z = [-10 -10 10 10];
    plane = patch(x, y, z, [0.3010 0.7450 0.9330]);
    plane.FaceVertexAlphaData = 0.1;
    plane.FaceAlpha = 'Flat';
    view(3)
    axis([-10 10 -10 10 -10 10])
    hold on
    
    plotPoint('rd', [-eyeDistance 0 0])
end