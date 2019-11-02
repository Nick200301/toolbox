function wireframeLine(original, eyeDistance, style, rotation, translation, a, b)
    %Expects a distance for the viewpoint, called eyeDistance, from the
    %yz-plane and two 1x3 arrays that represents two points in 3D.
    %wireframeLine() plots a line between the two input points and plots the projection of that
    %line onto the viewing plane with respect a viewpoint defined by the
    %parameter eyeDistance.
    
    in_put = [a; b];

    
    if ~isempty(rotation)
        max_values = max(in_put);
        min_values = min(in_put);
        midpoint = (max_values + min_values) / 2;
        for point = 1:2
            in_put(point,:) = my_rotate(in_put(point,:) - midpoint, rotation) + midpoint;
        end
    end
    
    if ~isempty(translation)
        in_put = in_put + translation;
    end
    
    a = in_put(1,:);
    b = in_put(2,:);
    projectionA = projection(eyeDistance, a);
    projectionB = projection(eyeDistance, b);

    if original == 1
        plotLine(style, a, b)
    end
    plotLine(style, projectionA, projectionB)
    
    
    
%     lineAB = b - a;
%     lineProjection = projectionB - projectionA;
%     
%     for i = 0:0.01:1
%         plotPoint('r.', a + i .* lineAB)
%         plotPoint('r.', projectionA + i .* lineProjection)
%     end

end