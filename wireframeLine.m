function wireframeLine(eyeDistance, a, b)
    %plots a line between to given points and plots the projection of that
    %line onto the viewing plane with respect to an eye defined by the
    %given eyeDistance.
    
    projectionA = projection(eyeDistance, a);
    projectionB = projection(eyeDistance, b);

    
    plotLine(a, b)
    plotLine(projectionA, projectionB)
    
    
    
%     lineAB = b - a;
%     lineProjection = projectionB - projectionA;
%     
%     for i = 0:0.01:1
%         plotPoint('r.', a + i .* lineAB)
%         plotPoint('r.', projectionA + i .* lineProjection)
%     end

end