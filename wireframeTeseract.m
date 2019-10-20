function wireframeTeseract(eyeDistance, cubeScalar, a, b, c, d)
    %make sure that a b c d make a square

    sidelengthSquare = sqrt( ( b(1) - a(1) ).^2 + ( b(2) - a(2) ).^2 + ( b(3) - a(3) ).^2 );

    e = a + [sidelengthSquare 0 0];
    f = b + [sidelengthSquare 0 0];
    g = c + [sidelengthSquare 0 0];
    h = d + [sidelengthSquare 0 0];

    wireframeCuboid(eyeDistance, a, b, c, d, e, f, g, h)

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

    wireframeCuboid(eyeDistance, at, bt, ct, dt, et, ft, gt, ht);

    for i = [1:8]
        wireframeLine(eyeDistance, verticesSmallCube(i,:), verticesBigCube(i,:))
    end

end