function picture3D(eyeDistance,a,b,c,d,e,f,g,h)

    wireframeCuboid(0,eyeDistance,'c',{},[0,0.1,0],a,b,c,d,e,f,g,h);
    wireframeCuboid(0,eyeDistance,'r',{},[0,-0.1,0],a,b,c,d,e,f,g,h);
end