function wireframeTeseract(eyeDistance, style, cubeScalar, a, b, c, d)
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

    wireframeCuboid(eyeDistance, style, a, b, c, d, e, f, g, h)

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

    wireframeCuboid(eyeDistance, style, at, bt, ct, dt, et, ft, gt, ht);

    for i = [1:8]
        wireframeLine(eyeDistance, style, verticesSmallCube(i,:), verticesBigCube(i,:))
    end

end