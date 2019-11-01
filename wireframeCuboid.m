function wireframeCuboid(eyeDistance, style, a, b, c, d, e, f, g, h)
    %Expects a distance for the viewpoint, called eyeDistance, from the
    %yz-plane and eight 1x3 arrays that represent points in 3D.
    %wireframeCuboid() connects the first four points to make a quadrangle
    %and does the same with the last four points. Then the first and the
    %fifth points are connected, the second and the sixth, etc. to make a 
    %cuboid. The cuboid is plotted and projected onto the viewing plane 
    %with respect to the viewpoint defined by the paramater eyeDistance. 
    
    vertices = [a; b; c; d; e; f; g; h;];

    wireframeQuadrangle(eyeDistance, style, a, b, c, d)
    wireframeQuadrangle(eyeDistance, style, e, f, g, h)

    for i = [1:4]
        wireframeLine(eyeDistance, style, vertices(i,:), vertices(i + 4,:))
    end
%     campos([-eyeDistance 0 0])
%     camtarget([-4 2 2])
%     plotPoint('g.', [(-eyeDistance - 0.5) 0 0])
end