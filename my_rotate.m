function rotated_vectors = my_rotate(vectors, rotation)

    rotated_vectors = vectors;
    dimVectors = size(vectors);
    
    for rotations = 1:2:length(rotation)
       angle = rotation{rotations + 1};
       switch rotation{rotations}
           case 'x'
               for vector = 1:dimVectors(1)
                   rotated_vectors(vector,:) = x_rotation(rotated_vectors(vector,:), angle);
               end
           case 'y'
               for vector = 1:dimVectors(1)
                   rotated_vectors(vector,:) = y_rotation(rotated_vectors(vector,:), angle);
               end
           case 'z'
               for vector = 1:dimVectors(1)
                   rotated_vectors(vector,:) = z_rotation(rotated_vectors(vector,:), angle);
               end
       end
    end
    
    
    function rotated_vector = x_rotation(vector, angle)
        M = [1 0 0; 0 cos(angle) sin(angle); 0 -sin(angle) cos(angle);];
        rotated_vector = M * vector';
    end

    function rotated_vector = y_rotation(vector, angle)
        M = [cos(angle) 0 -sin(angle); 0 1 0; sin(angle) 0 cos(angle)];
        rotated_vector = M * vector';
    end

    function rotated_vector = z_rotation(vector, angle)
        M = [cos(angle) sin(angle) 0; -sin(angle) cos(angle) 0; 0 0 1];
        rotated_vector = M * vector';
    end

end