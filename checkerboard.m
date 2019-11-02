function checkerboard(original, eyeDistance, size, height, tilt)
    x = [0 0 size size];
    z = [height height height + tilt height + tilt];
    
    for column = 1:ceil(20 / size) * 2
        y = [20 (20 - size) (20 - size) 20];
        
        for row = 1:ceil(20 / size) * 2           
            if mod(row + column, 2) == 0
                if original == 1
                    patch(x, y, z, 'black')
                end
                y_proj = [((-eyeDistance / (-eyeDistance - x(1)) .* y(1))) ((-eyeDistance / (-eyeDistance - x(2)) .* y(2))) ((-eyeDistance / (-eyeDistance - x(3)) .* y(3))) ((-eyeDistance / (-eyeDistance - x(4)) .* y(4)))];
                z_proj = [((-eyeDistance / (-eyeDistance - x(1)) .* z(1))) ((-eyeDistance / (-eyeDistance - x(2)) .* z(2))) ((-eyeDistance / (-eyeDistance - x(3)) .* z(3))) ((-eyeDistance / (-eyeDistance - x(4)) .* z(4)))];
                patch([-0.01 -0.01 -0.01 -0.01], y_proj, z_proj, 'black')
            else
                if original == 1
                    patch(x, y, z, 'white')
                end
                y_proj = [((-eyeDistance / (-eyeDistance - x(1)) .* y(1))) ((-eyeDistance / (-eyeDistance - x(2)) .* y(2))) ((-eyeDistance / (-eyeDistance - x(3)) .* y(3))) ((-eyeDistance / (-eyeDistance - x(4)) .* y(4)))];
                z_proj = [((-eyeDistance / (-eyeDistance - x(1)) .* z(1))) ((-eyeDistance / (-eyeDistance - x(2)) .* z(2))) ((-eyeDistance / (-eyeDistance - x(3)) .* z(3))) ((-eyeDistance / (-eyeDistance - x(4)) .* z(4)))];
                patch([-0.01 -0.01 -0.01 -0.01], y_proj, z_proj, 'white')
            end
            
            y = y - size;            
        end
        
        x = x + size;
        z = z + tilt;
    end
end