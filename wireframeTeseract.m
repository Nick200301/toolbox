function wireframeTeseract(original, eyeDistance, style, cubeScalar, rotation, translation, a, b, c, d)
    %Expects a distance for the viewpoint, called eyeDistance, from the
    %yz-plane, a scalar for the second cube of the teseract and four 1x3
    %arrays that represent points in 3D. These points should make a square.
    %wireframeTeseract() will construct a cube from the input point, a
    %second cube that is equal to the first cube scaled by a factor equal
    %to the parameter cubeScalar with the centre of the cube as an anchor
    %point. Then the respective vertices are connected by lines to make a
    %teseract. This teseract is plotted and then projected onto the viewing
    %plane with respect to a viewpoint definde by the parameter
    %eyeDistance.

    sidelengthSquare = sqrt( ( b(1) - a(1) ).^2 + ( b(2) - a(2) ).^2 + ( b(3) - a(3) ).^2 );

    e = a + [sidelengthSquare 0 0];
    f = b + [sidelengthSquare 0 0];
    g = c + [sidelengthSquare 0 0];
    h = d + [sidelengthSquare 0 0];

    %translate the midpoint of the cube to the origin

    midpointCube = 0.5 .* ((0.5 .* (b + a)) + (0.5 .* (f + e))) + [0 0 (sidelengthSquare / 2)];

    at = (a - midpointCube) .* cubeScalar + midpointCube;
    bt = (b - midpointCube) .* cubeScalar + midpointCube;
    ct = (c - midpointCube) .* cubeScalar + midpointCube;
    dt = (d - midpointCube) .* cubeScalar + midpointCube;
    et = (e - midpointCube) .* cubeScalar + midpointCube;
    ft = (f - midpointCube) .* cubeScalar + midpointCube;
    gt = (g - midpointCube) .* cubeScalar + midpointCube;
    ht = (h - midpointCube) .* cubeScalar + midpointCube;

    verticesSmallCube = [a; b; c; d; e; f; g; h;];
    verticesBigCube = [at; bt; ct; dt; et; ft; gt; ht;];

    if ~isempty(rotation)
        max_values = max(verticesSmallCube);
        min_values = min(verticesSmallCube);
        midpoint = (max_values + min_values) / 2;
        for point = 1:8
            verticesSmallCube(point,:) = my_rotate(verticesSmallCube(point,:) - midpoint, rotation) + midpoint;
        end
    end
    
    if ~isempty(translation)
        verticesSmallCube = verticesSmallCube + translation;
    end
    
    if ~isempty(rotation)
        max_values = max(verticesBigCube);
        min_values = min(verticesBigCube);
        midpoint = (max_values + min_values) / 2;
        for point = 1:8
            verticesBigCube(point,:) = my_rotate(verticesBigCube(point,:) - midpoint, rotation) + midpoint;
        end
    end
    
    if ~isempty(translation)
        verticesBigCube = verticesBigCube + translation;
    end
    
    a = verticesSmallCube(1,:);
    b = verticesSmallCube(2,:);
    c = verticesSmallCube(3,:);
    d = verticesSmallCube(4,:);
    e = verticesSmallCube(5,:);
    f = verticesSmallCube(6,:);
    g = verticesSmallCube(7,:);
    h = verticesSmallCube(8,:);
    at = verticesBigCube(1,:);
    bt = verticesBigCube(2,:);
    ct = verticesBigCube(3,:);
    dt = verticesBigCube(4,:);
    et = verticesBigCube(5,:);
    ft = verticesBigCube(6,:);
    gt = verticesBigCube(7,:);
    ht = verticesBigCube(8,:);
    
    wireframeCuboid(original, eyeDistance, style, {}, [], a, b, c, d, e, f, g, h)
    wireframeCuboid(original, eyeDistance, style, {}, [], at, bt, ct, dt, et, ft, gt, ht);

    for i = 1:8
        wireframeLine(original, eyeDistance, style, {}, [], verticesSmallCube(i,:), verticesBigCube(i,:))
    end

end