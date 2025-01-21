


k=10; %% Specify Gear Module in millimeters
p=20; %% Specify pressure angle of the gear in degrees
n=30; %% Specify number of tooth on gear. If pitch diameter(d) is given then n=d/m
cp=pi*k;


%base circle radius: rb
%addendum circle radius: ra
%pitch circle radius: rp
rp=(k*n)/2;
rb=rp*cosd(p);
ra=rp+k;

ga=((((ra/rb)^2)-1)^0.5); %% Gamma for addendum circle radius
gp=((((rp/rb)^2)-1)^0.5); %% Gamma for pitch circle radius
z=5; %% Specify Number of Shi values needed
gm=0:0.001:ga; %% Creating a range of gamma values for plotting lower side of involute tooth


ta=ga-atan(ga); %% Theta for addendum circle radius
tp=gp-atan(gp); %% Theta for pitch circle radius
ty=gm-atan(gm); %% Corresponding range of Theta values for plotting lower side of involute tooth


sa=tp+(pi/(2*n))-ta; %% Shi for addendum circle radius
sans=tp+(pi/(2*n))-gm; %% Corresponding range of Shi values for plotting lower side of involute tooth
sm=ta:0.001:ta+(2*sa);
g=size(sm);

ry=rb*((1+(gm.^2)).^0.5); %% Corresponding range of radii values for plotting lower side of involute tooth
ty2=ty+(2*sa)+ta; %% Range of Theta angles for other side of involute tooth
gm2=flip(gm);
ry2=rb*((1+(gm2.^2)).^0.5); %% Range of radii for other side of involute tooth


gm3=-ga:0.001:0; %% Range of gamma for other side of involute tooth
ry3=rb*((1+(gm3.^2)).^0.5); %% Range of radii for other side of involute tooth
ty4=gm3-atan(gm3); %% Range of theta for other side of involute tooth
ty5=ty4+(2*sa)+(2*ta); %% Shift the range of theta values by the angle subtended by the rest of the gear tooth at the centre of the gear
o=ones(1,g(2));
ras=o.*ra; %% Creating array of addendum circle radius for polar plot


polarplot(ty,ry,'b')
hold on
polarplot(sm,ras,'b')
hold on
polarplot(ty5,ry3,'b')