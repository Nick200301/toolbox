function wireframeQuadrangle(eyeDistance, varargin)
    %Expects a distance for the viewpoint, called eyeDistance, from the
    %yz-plane and any number of 1x3 arrays that represent points in 3D.
    %wireframeQuadrangle() connects the points in order of input (input 1
    %and 2, input 2 and 3, etc.), plots the resulting image and plots its
    %projection onto the viewing plane with respect to the viewpoint
    %defined by the paramter eyeDistance.

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