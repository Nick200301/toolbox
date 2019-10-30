function wireframeQuadrangle(eyeDistance, varargin)
    %plots a wireframe of a surface defined by the inputted points. The
    %program connects these points in the order of input. It plots the projection onto
    %a plane.

    vertices = zeros(length(varargin), 3);
    for vertice = [1:length(varargin)]
        vertices(vertice,:) = cell2mat(varargin(vertice));
    end
    
    dimVertices = size(vertices);
    
    for i = [1:dimVertices(1) - 1]
        wireframeLine(eyeDistance, vertices(i,:), vertices(i + 1,:))
    end
    wireframeLine(eyeDistance, vertices(dimVertices(1),:), vertices(1,:))

    view([-40 9])
end