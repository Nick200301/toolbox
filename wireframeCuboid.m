function wireframeCuboid(eyeDistance, a, b, c, d, e, f, g, h)
    %plots a wireframe of a cuboid with eight vertices as the input. It
    %will connect with lines the first four vertices in order, then the
    %last four vertices and will then connect the first with the fifth
    %vertice, the second with the sixth, etc. It plots the projection onto
    %a plane.

    vertices = [a; b; c; d; e; f; g; h;];

    wireframeQuadrangle(eyeDistance, a, b, c, d)
    wireframeQuadrangle(eyeDistance, e, f, g, h)

    for i = [1:4]
        wireframeLine(eyeDistance, vertices(i,:), vertices(i + 4,:))
    end

end