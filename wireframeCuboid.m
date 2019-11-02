function wireframeCuboid(original, eyeDistance, style, rotation, translation, a, b, c, d, e, f, g, h)
    %Expects a distance for the viewpoint, called eyeDistance, from the
    %yz-plane and eight 1x3 arrays that represent points in 3D.
    %wireframeCuboid() connects the first four points to make a quadrangle
    %and does the same with the last four points. Then the first and the
    %fifth points are connected, the second and the sixth, etc. to make a 
    %cuboid. The cuboid is plotted and projected onto the viewing plane 
    %with respect to the viewpoint defined by the paramater eyeDistance. 
    
    vertices = [a; b; c; d; e; f; g; h;];

    if ~isempty(rotation)
        max_values = max(vertices);
        min_values = min(vertices);
        midpoint = (max_values + min_values) / 2;
        for point = 1:8
            vertices(point,:) = my_rotate(vertices(point,:) - midpoint, rotation) + midpoint;
        end
    end
    
    if ~isempty(translation)
        vertices = vertices + translation;
    end
    
    a = vertices(1,:);
    b = vertices(2,:);
    c = vertices(3,:);
    d = vertices(4,:);
    e = vertices(5,:);
    f = vertices(6,:);
    g = vertices(7,:);
    h = vertices(8,:);
    
    wireframeQuadrangle(original, eyeDistance, style, {}, [], a, b, c, d)
    wireframeQuadrangle(original, eyeDistance, style, {}, [], e, f, g, h)

    for i = 1:4
        wireframeLine(original, eyeDistance, style, {}, [], vertices(i,:), vertices(i + 4,:))
    end
end