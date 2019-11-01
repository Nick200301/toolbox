function wireframeLine(eyeDistance, style, a, b)
    %Expects a distance for the viewpoint, called eyeDistance, from the
    %yz-plane and two 1x3 arrays that represents two points in 3D.
    %wireframeLine() plots a line between the two input points and plots the projection of that
    %line onto the viewing plane with respect a viewpoint defined by the
    %parameter eyeDistance.
    
    projectionA = projection(eyeDistance, a);
    projectionB = projection(eyeDistance, b);

    
    plotLine(style, a, b)
    plotLine(style, projectionA, projectionB)
    
    
    
%     lineAB = b - a;
%     lineProjection = projectionB - projectionA;
%     
%     for i = 0:0.01:1
%         plotPoint('r.', a + i .* lineAB)
%         plotPoint('r.', projectionA + i .* lineProjection)
%     end

end