function [projectedPoint] = wireframePoint(eyeDistance, a)
    %Expects a distance for the viewpoint, called eyeDistance, from the
    %yz-plane and a 1x3 array that represents a point in 3D.
    %projectedPoint() plots the input point in 3D and also plots the projection onto a plane
    %with respect to an viewpoint defined by the parameter eyeDistance.

    projectionScalar = -eyeDistance ./ (-eyeDistance - a(1));

    projectedPoint = projectionScalar .* [0 a(2) a(3)];

    eyePoint = [-eyeDistance 0 0];

    plotPoint('rd', eyePoint)
    plotPoint('r.', a)
    plotPoint('r.', projection(eyeDistance, a))
end