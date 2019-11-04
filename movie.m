N=10;
eyeDistance=15;

a=[-3,3,3];
b=[-3,3,-1];
c=[-3,1,-1];
d=[-3,1,3];
e=[-1,3,3];
f=[-1,3,-1];
g=[-1,1,-1];
h=[-1,1,3];

a1=[-3,-3,5];
b1=[-3,-3,-1];
c1=[-3,-1,-1];
d1=[-3,-1,5];
e1=[-1,-3,5];
f1=[-1,-3,-1];
g1=[-1,-1,-1];
h1=[-1,-1,5];

for n=1:N
    clf('reset')
    eyedistance=eyeDistance-n;
    wireframeCuboid(0,eyedistance,'k',{},[], a, b, c, d, e, f, g, h);
    wireframeCuboid(0,eyedistance,'k',{},[], a1, b1, c1, d1, e1, f1, g1, h1);
    view([-10,0,0]);
    
    m(:,n)=getframe;
end