function wireframeLine(eyeDistance, a, b)
    
    projectionA = wireframePoint(eyeDistance, a);
    projectionB = wireframePoint(eyeDistance, b);
    
    lineAB = b - a;
    lineProjection = projectionB - projectionA;
    
    for i = 0:0.01:1
        plotPoint('r.', a + i .* lineAB)
        plotPoint('r.', projectionA + i .* lineProjection)
    end

end