function translated_vectors = my_translate(vectors, translation)
    translated_vectors = vectors;
    dimVectors = size(vectors);
    
    for vector = 1:dimVectors(1)
        translated_vectors(vector,:) = translated_vectors(vector,:) + translation;
    end
        
end