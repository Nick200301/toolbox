function wireframeQuadrangle(eyeDistance, varargin)
%enter the vertices of the 2D shape in a counter-clockwise direction

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