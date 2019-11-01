function streetview(eyeDistance, varargin)
    points = zeros(nargin - 1, 3);
    
    for arg = 1:(nargin - 1)
        point = cell2mat(varargin(arg));
        projectionScalar = -eyeDistance ./ (-eyeDistance - point(1));
        projectedPoint = projectionScalar .* [0 point(2) point(3)]; 
        points(arg,:) = projectedPoint;
    end
    midpoints = (max(points) + min(points)) / 2;
    disp(points)
    disp(midpoints)
    campos([-eyeDistance midpoints(2) midpoints(3)])
    camtarget(midpoints)
end