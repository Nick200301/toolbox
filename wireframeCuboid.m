function wireframeCuboid(eyeDistance, a, b, c, d, e, f, g, h)

    vertices = [a; b; c; d; e; f; g; h;];

    wireframeQuadrangle(eyeDistance, a, b, c, d)
    wireframeQuadrangle(eyeDistance, e, f, g, h)

    for i = [1:4]
        wireframeLine(eyeDistance, vertices(i,:), vertices(i + 4,:))
    end

end