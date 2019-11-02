function wireframeAxis(original, eyeDistance, rotation, translation)
    axes = [10 0 0; 0 10 0; 0 0 10; -10 0 0; 0 -10 0; 0 0 -10; 0 0 0];
    
    axes = my_rotate(axes, rotation);
    axes = my_translate(axes, translation);
    
    if original == 1
        for axe = 1:6
            plotLine('r', axes(7,:), axes(axe,:))
        end
    end
    
    for axe = 1:6
        plotLine('b', projection(eyeDistance, axes(7,:)), projection(eyeDistance, axes(axe,:)))
    end
end