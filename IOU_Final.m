clc
clear all

%% Coordinates and plot
% r1_x1=input('enter x1 value of 1st quad ='); r1_y1=input('enter y1 value of 1st quad =');
% r1_x2=input('enter x2 value of 1st quad ='); r1_y2=input('enter y2 value of 1st quad =');
% r1_x3=input('enter x3 value of 1st quad ='); r1_y3=input('enter y3 value of 1st quad =');
% r1_x4=input('enter x4 value of 1st quad ='); r1_y4=input('enter y4 value of 1st quad =');
% 
% r2_x1=input('enter x1 value of 2nd quad ='); r2_y1=input('enter y1 value of 2nd quad =');
% r2_x2=input('enter x2 value of 2nd quad ='); r2_y2=input('enter y2 value of 2nd quad =');
% r2_x3=input('enter x3 value of 2nd quad ='); r2_y3=input('enter y3 value of 2nd quad =');
% r2_x4=input('enter x4 value of 2nd quad ='); r2_y4=input('enter y4 value of 2nd quad =');
r1_x1=1;r1_y1=1;
r1_x2=2;r1_y2=5;
r1_x3=5;r1_y3=5;
r1_x4=4;r1_y4=1;

r2_x1=1.5;r2_y1=1.5;
r2_x2=2;r2_y2=5.5;
r2_x3=4.5;r2_y3=5.5;
r2_x4=5;r2_y4=1.5;

%  r1_x1=3;r1_y1=3;
%  r1_x2=4;r1_y2=8;
%  r1_x3=9;r1_y3=8;
%  r1_x4=6;r1_y4=3;
%  
%  r2_x1=3;r2_y1=3;
%  r2_x2=4;r2_y2=8;
%  r2_x3=9;r2_y3=8;
%  r2_x4=6;r2_y4=3;

plot([r1_x1 r1_x2],[r1_y1 r1_y2],'g','LineWidth',2);
hold on
plot([r1_x2 r1_x3],[r1_y2 r1_y3],'g','LineWidth',2);
hold on
plot([r1_x3 r1_x4],[r1_y3 r1_y4],'g','LineWidth',2);
hold on
plot([r1_x4 r1_x1],[r1_y4 r1_y1],'g','LineWidth',2);
hold on

plot([r2_x1 r2_x2],[r2_y1 r2_y2],'r','LineWidth',2);
hold on
plot([r2_x2 r2_x3],[r2_y2 r2_y3],'r','LineWidth',2);
hold on
plot([r2_x3 r2_x4],[r2_y3 r2_y4],'r','LineWidth',2);
hold on
plot([r2_x4 r2_x1],[r2_y4 r2_y1],'r','LineWidth',2);
hold on

axis('equal')
axis([-20 20 -20 20])

% Intersection points
IntersectionArray_X=[];
IntersectionArray_Y=[];

%% finding the 1st point of quad1 is lying inside the 2nd quadriateral or not
Dummy_X=[];
Dummy_y=[];
x0=21;
y0=r1_y1;
if (r1_x1==r2_x1 && r1_y1==r2_y1) || (r1_x1==r2_x2 && r1_y1==r2_y2)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;
else
    sol=intersection_check(r1_x1,r1_y1,x0,y0,r2_x1,r2_y1,r2_x2,r2_y2);
    if max(r2_x2,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x1) && max(r2_y2,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y1)
        if max(x0,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x1) && max(y0,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y1)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x1==r2_x2 && r1_y1==r2_y2) || (r1_x1==r2_x3 && r1_y1==r2_y3)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;
else  
    sol=intersection_check(r1_x1,r1_y1,x0,y0,r2_x2,r2_y2,r2_x3,r2_y3);
    if max(r2_x2,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x3) && max(r2_y2,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y3)
        if max(x0,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x1) && max(y0,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y1)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x1==r2_x3 && r1_y1==r2_y3) || (r1_x1==r2_x4 && r1_y1==r2_y4)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;
else  
    sol=intersection_check(r1_x1,r1_y1,x0,y0,r2_x3,r2_y3,r2_x4,r2_y4);
    if max(r2_x4,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x3) && max(r2_y4,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y3)
        if max(x0,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x1) && max(y0,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y1)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x1==r2_x4 && r1_y1==r2_y4) || (r1_x1==r2_x1 && r1_y1==r2_y1)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;
else  
    sol=intersection_check(r1_x1,r1_y1,x0,y0,r2_x4,r2_y4,r2_x1,r2_y1);
    if max(r2_x4,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x1) && max(r2_y4,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y1)
        if max(x0,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x1) && max(y0,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y1)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

% Remove the repeatation of intersection points from dummay
for i=1:length(Dummy_X)-1
    for j=i+1:length(Dummy_X)
        if Dummy_X(i)==Dummy_X(j) && Dummy_y(i)==Dummy_y(j)
            Dummy_X(j)=Inf;
            Dummy_y(j)=Inf;
        end
    end
end
Dummy_X1=[];
Dummy_y1=[];
for i=1:length(Dummy_X)
    if Dummy_X(i) ~= Inf
        Dummy_X1(end+1)=Dummy_X(i);
        Dummy_y1(end+1)=Dummy_y(i);
    end
end
if rem(length(Dummy_X1),2)~=0
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;
    plot(r1_x1,r1_y1,'r*','MarkerSize',3);
    hold on
end

%% Finding intersection of 1st line of 1st Quat with 2nd Quad
if (r1_x1==r2_x1 && r1_y1==r2_y1) || (r1_x1==r2_x2 && r1_y1==r2_y2)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;    
elseif (r1_x2==r2_x1 && r1_y2==r2_y1) || (r1_x2==r2_x2 && r1_y2==r2_y2)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;
else
    sol=intersection_check(r1_x1,r1_y1,r1_x2,r1_y2,r2_x1,r2_y1,r2_x2,r2_y2);
    if max(r2_x2,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x1) && max(r2_y2,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y1)
        if max(r1_x2,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x2,r1_x1) && max(r1_y2,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y2,r1_y1)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x1==r2_x2 && r1_y1==r2_y2) || (r1_x1==r2_x3 && r1_y1==r2_y3)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;    
elseif (r1_x2==r2_x2 && r1_y2==r2_y2) || (r1_x2==r2_x3 && r1_y2==r2_y3)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;
else
    sol=intersection_check(r1_x1,r1_y1,r1_x2,r1_y2,r2_x2,r2_y2,r2_x3,r2_y3);
    if max(r2_x2,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x3) && max(r2_y2,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y3)
        if max(r1_x2,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x2,r1_x1) && max(r1_y2,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y2,r1_y1)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x1==r2_x3 && r1_y1==r2_y3) || (r1_x1==r2_x4 && r1_y1==r2_y4)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;    
elseif (r1_x2==r2_x3 && r1_y2==r2_y3) || (r1_x2==r2_x4 && r1_y2==r2_y4)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;
else
    sol=intersection_check(r1_x1,r1_y1,r1_x2,r1_y2,r2_x3,r2_y3,r2_x4,r2_y4);
    if max(r2_x4,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x3) && max(r2_y4,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y3)
        if max(r1_x2,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x2,r1_x1) && max(r1_y2,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y2,r1_y1)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x1==r2_x4 && r1_y1==r2_y4) || (r1_x1==r2_x1 && r1_y1==r2_y1)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;    
elseif (r1_x2==r2_x4 && r1_y2==r2_y4) || (r1_x2==r2_x1 && r1_y2==r2_y1)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;
else
    sol=intersection_check(r1_x1,r1_y1,r1_x2,r1_y2,r2_x4,r2_y4,r2_x1,r2_y1);
    if max(r2_x4,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x1) && max(r2_y4,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y1)
        if max(r1_x2,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x2,r1_x1) && max(r1_y2,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y2,r1_y1)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

%% finding the 2nd point of quad1 is lying inside the 2nd quadriateral or not
Dummy_X=[];
Dummy_y=[];
x0=21;
y0=r1_y2;

if (r1_x2==r2_x1 && r1_y2==r2_y1) || (r1_x2==r2_x2 && r1_y2==r2_y2)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;
else  
    sol=intersection_check(r1_x2,r1_y2,x0,y0,r2_x1,r2_y1,r2_x2,r2_y2);
    if max(r2_x2,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x1) && max(r2_y2,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y1)
        if max(x0,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x2) && max(y0,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y2)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x2==r2_x2 && r1_y2==r2_y2) || (r1_x2==r2_x3 && r1_y2==r2_y3)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;
else  
    sol=intersection_check(r1_x2,r1_y2,x0,y0,r2_x2,r2_y2,r2_x3,r2_y3);
    if max(r2_x2,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x3) && max(r2_y2,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y3)
        if max(x0,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x2) && max(y0,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y2)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x2==r2_x3 && r1_y2==r2_y3) || (r1_x2==r2_x4 && r1_y2==r2_y4)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;
else  
    sol=intersection_check(r1_x2,r1_y2,x0,y0,r2_x3,r2_y3,r2_x4,r2_y4);
    if max(r2_x4,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x3) && max(r2_y4,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y3)
        if max(x0,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x2) && max(y0,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y2)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x2==r2_x4 && r1_y2==r2_y4) || (r1_x2==r2_x1 && r1_y2==r2_y1)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;
else 
    sol=intersection_check(r1_x2,r1_y2,x0,y0,r2_x4,r2_y4,r2_x1,r2_y1);
    if max(r2_x4,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x1) && max(r2_y4,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y1)
        if max(x0,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x2) && max(y0,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y2)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

% Remove the repeatation of intersection points from dummay
for i=1:length(Dummy_X)-1
    for j=i+1:length(Dummy_X)
        if Dummy_X(i)==Dummy_X(j) && Dummy_y(i)==Dummy_y(j)
            Dummy_X(j)=Inf;
            Dummy_y(j)=Inf;
        end
    end
end
Dummy_X1=[];
Dummy_y1=[];
for i=1:length(Dummy_X)
    if Dummy_X(i) ~= Inf
        Dummy_X1(end+1)=Dummy_X(i);
        Dummy_y1(end+1)=Dummy_y(i);
    end
end
if rem(length(Dummy_X1),2)~=0
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;
    plot(r1_x2,r1_y2,'r*','MarkerSize',3);
    hold on
end

%% Finding intersection of 2nd line of 1st Quat with 2nd Quad
if (r1_x2==r2_x1 && r1_y2==r2_y1) || (r1_x2==r2_x2 && r1_y2==r2_y2)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;    
elseif (r1_x3==r2_x1 && r1_y3==r2_y1) || (r1_x3==r2_x2 && r1_y3==r2_y2)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;
else
    sol=intersection_check(r1_x2,r1_y2,r1_x3,r1_y3,r2_x1,r2_y1,r2_x2,r2_y2);
    if max(r2_x2,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x1) && max(r2_y2,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y1)
        if max(r1_x3,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x3,r1_x2) && max(r1_y3,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y3,r1_y2)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x2==r2_x2 && r1_y2==r2_y2) || (r1_x2==r2_x3 && r1_y2==r2_y3)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;    
elseif (r1_x3==r2_x2 && r1_y3==r2_y2) || (r1_x3==r2_x3 && r1_y3==r2_y3)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;
else
    sol=intersection_check(r1_x2,r1_y2,r1_x3,r1_y3,r2_x2,r2_y2,r2_x3,r2_y3);
    if max(r2_x2,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x3) && max(r2_y2,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y3)
        if max(r1_x3,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x3,r1_x2) && max(r1_y3,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y3,r1_y2)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x2==r2_x3 && r1_y2==r2_y3) || (r1_x2==r2_x4 && r1_y2==r2_y4)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;    
elseif (r1_x3==r2_x3 && r1_y3==r2_y3) || (r1_x3==r2_x4 && r1_y3==r2_y4)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;
else
    sol=intersection_check(r1_x2,r1_y2,r1_x3,r1_y3,r2_x3,r2_y3,r2_x4,r2_y4);
    if max(r2_x4,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x3) && max(r2_y4,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y3)
        if max(r1_x3,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x3,r1_x2) && max(r1_y3,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y3,r1_y2)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x2==r2_x4 && r1_y2==r2_y4) || (r1_x2==r2_x1 && r1_y2==r2_y1)
    IntersectionArray_X(end+1)=r1_x2;
    IntersectionArray_Y(end+1)=r1_y2;    
elseif (r1_x3==r2_x4 && r1_y3==r2_y4) || (r1_x3==r2_x1 && r1_y3==r2_y1)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;
else
    sol=intersection_check(r1_x2,r1_y2,r1_x3,r1_y3,r2_x4,r2_y4,r2_x1,r2_y1);
    if max(r2_x4,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x1) && max(r2_y4,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y1)
        if max(r1_x3,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x3,r1_x2) && max(r1_y3,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y3,r1_y2)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

%% finding the 3rd point of quad1 is lying inside the 2nd quadriateral or not
Dummy_X=[];
Dummy_y=[];
x0=21;
y0=r1_y3;

if (r1_x3==r2_x1 && r1_y3==r2_y1) || (r1_x3==r2_x2 && r1_y3==r2_y2)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;
else 
    sol=intersection_check(r1_x3,r1_y3,x0,y0,r2_x1,r2_y1,r2_x2,r2_y2);
    if max(r2_x2,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x1) && max(r2_y2,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y1)
        if max(x0,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x3) && max(y0,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y3)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x3==r2_x2 && r1_y3==r2_y2) || (r1_x3==r2_x3 && r1_y3==r2_y3)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;
else 
    sol=intersection_check(r1_x3,r1_y3,x0,y0,r2_x2,r2_y2,r2_x3,r2_y3);
    if max(r2_x2,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x3) && max(r2_y2,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y3)
        if max(x0,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x3) && max(y0,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y3)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x3==r2_x3 && r1_y3==r2_y3) || (r1_x3==r2_x4 && r1_y3==r2_y4)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;
else 
    sol=intersection_check(r1_x3,r1_y3,x0,y0,r2_x3,r2_y3,r2_x4,r2_y4);
    if max(r2_x4,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x3) && max(r2_y4,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y3)
        if max(x0,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x3) && max(y0,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y3)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x3==r2_x4 && r1_y3==r2_y4) || (r1_x3==r2_x1 && r1_y3==r2_y1)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;
else 
    sol=intersection_check(r1_x3,r1_y3,x0,y0,r2_x4,r2_y4,r2_x1,r2_y1);
    if max(r2_x4,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x1) && max(r2_y4,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y1)
        if max(x0,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x3) && max(y0,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y3)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

% Remove the repeatation of intersection points from dummay
for i=1:length(Dummy_X)-1
    for j=i+1:length(Dummy_X)
        if Dummy_X(i)==Dummy_X(j) && Dummy_y(i)==Dummy_y(j)
            Dummy_X(j)=Inf;
            Dummy_y(j)=Inf;
        end
    end
end
Dummy_X1=[];
Dummy_y1=[];
for i=1:length(Dummy_X)
    if Dummy_X(i) ~= Inf
        Dummy_X1(end+1)=Dummy_X(i);
        Dummy_y1(end+1)=Dummy_y(i);
    end
end
if rem(length(Dummy_X1),2)~=0
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;
    plot(r1_x3,r1_y3,'r*','MarkerSize',3);
    hold on
end

%% Finding intersection of 3rd line of 1st Quat with 2nd Quad
if (r1_x3==r2_x1 && r1_y3==r2_y1) || (r1_x3==r2_x2 && r1_y3==r2_y2)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;    
elseif (r1_x4==r2_x1 && r1_y4==r2_y1) || (r1_x4==r2_x2 && r1_y4==r2_y2)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;
else
    sol=intersection_check(r1_x3,r1_y3,r1_x4,r1_y4,r2_x1,r2_y1,r2_x2,r2_y2);
    if max(r2_x2,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x1) && max(r2_y2,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y1)
        if max(r1_x4,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x4,r1_x3) && max(r1_y4,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y4,r1_y3)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x3==r2_x2 && r1_y3==r2_y2) || (r1_x3==r2_x3 && r1_y3==r2_y3)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;    
elseif (r1_x4==r2_x2 && r1_y4==r2_y2) || (r1_x4==r2_x3 && r1_y4==r2_y3)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;
else
    sol=intersection_check(r1_x3,r1_y3,r1_x4,r1_y4,r2_x2,r2_y2,r2_x3,r2_y3);
    if max(r2_x2,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x3) && max(r2_y2,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y3)
        if max(r1_x4,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x4,r1_x3) && max(r1_y4,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y4,r1_y3)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x3==r2_x3 && r1_y3==r2_y3) || (r1_x3==r2_x4 && r1_y3==r2_y4)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;    
elseif (r1_x4==r2_x3 && r1_y4==r2_y3) || (r1_x4==r2_x4 && r1_y4==r2_y4)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;
else
    sol=intersection_check(r1_x3,r1_y3,r1_x4,r1_y4,r2_x3,r2_y3,r2_x4,r2_y4);
    if max(r2_x4,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x3) && max(r2_y4,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y3)
        if max(r1_x4,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x4,r1_x3) && max(r1_y4,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y4,r1_y3)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x3==r2_x4 && r1_y3==r2_y4) || (r1_x3==r2_x1 && r1_y3==r2_y1)
    IntersectionArray_X(end+1)=r1_x3;
    IntersectionArray_Y(end+1)=r1_y3;    
elseif (r1_x4==r2_x4 && r1_y4==r2_y4) || (r1_x4==r2_x1 && r1_y4==r2_y1)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;
else
    sol=intersection_check(r1_x3,r1_y3,r1_x4,r1_y4,r2_x4,r2_y4,r2_x1,r2_y1);
    if max(r2_x4,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x1) && max(r2_y4,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y1)
        if max(r1_x4,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x4,r1_x3) && max(r1_y4,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y4,r1_y3)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

%% finding the 4th point of quad1 is lying inside the 2nd quadriateral or not
Dummy_X=[];
Dummy_y=[];
x0=21;
y0=r1_y4;

if (r1_x4==r2_x1 && r1_y4==r2_y1) || (r1_x4==r2_x2 && r1_y4==r2_y2)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;
else 
    sol=intersection_check(r1_x4,r1_y4,x0,y0,r2_x1,r2_y1,r2_x2,r2_y2);
    if max(r2_x2,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x1) && max(r2_y2,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y1)
        if max(x0,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x4) && max(y0,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y4)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x4==r2_x2 && r1_y4==r2_y2) || (r1_x4==r2_x3 && r1_y4==r2_y3)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;
else
    sol=intersection_check(r1_x4,r1_y4,x0,y0,r2_x2,r2_y2,r2_x3,r2_y3);
    if max(r2_x2,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x3) && max(r2_y2,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y3)
        if max(x0,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x4) && max(y0,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y4)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x4==r2_x3 && r1_y4==r2_y3) || (r1_x4==r2_x4 && r1_y4==r2_y4)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;
else
    sol=intersection_check(r1_x4,r1_y4,x0,y0,r2_x3,r2_y3,r2_x4,r2_y4);
    if max(r2_x4,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x3) && max(r2_y4,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y3)
        if max(x0,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x4) && max(y0,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y4)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

if (r1_x4==r2_x4 && r1_y4==r2_y4) || (r1_x4==r2_x1 && r1_y4==r2_y1)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;
else
    sol=intersection_check(r1_x4,r1_y4,x0,y0,r2_x4,r2_y4,r2_x1,r2_y1);
    if max(r2_x4,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x1) && max(r2_y4,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y1)
        if max(x0,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r1_x4) && max(y0,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r1_y4)
            Dummy_X(end+1)=round(sol(1),2);
            Dummy_y(end+1)=round(sol(2),2);
        end
    end
end

% Remove the repeatation of intersection points from dummay
for i=1:length(Dummy_X)-1
    for j=i+1:length(Dummy_X)
        if Dummy_X(i)==Dummy_X(j) && Dummy_y(i)==Dummy_y(j)
            Dummy_X(j)=Inf;
            Dummy_y(j)=Inf;
        end
    end
end
Dummy_X1=[];
Dummy_y1=[];
for i=1:length(Dummy_X)
    if Dummy_X(i) ~= Inf
        Dummy_X1(end+1)=Dummy_X(i);
        Dummy_y1(end+1)=Dummy_y(i);
    end
end
if rem(length(Dummy_X1),2)~=0
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;
    plot(r1_x4,r1_y4,'r*','MarkerSize',3);
    hold on
end

%% Finding intersection of 4th line of 1st Quat with 2nd Quad
if (r1_x4==r2_x1 && r1_y4==r2_y1) || (r1_x4==r2_x2 && r1_y4==r2_y2)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;    
elseif (r1_x1==r2_x1 && r1_y1==r2_y1) || (r1_x1==r2_x2 && r1_y1==r2_y2)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;
else
    sol=intersection_check(r1_x4,r1_y4,r1_x1,r1_y1,r2_x1,r2_y1,r2_x2,r2_y2);
    if max(r2_x2,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x1) && max(r2_y2,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y1)
        if max(r1_x1,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x1,r1_x4) && max(r1_y1,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y1,r1_y4)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x4==r2_x2 && r1_y4==r2_y2) || (r1_x4==r2_x3 && r1_y4==r2_y3)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;    
elseif (r1_x1==r2_x2 && r1_y1==r2_y2) || (r1_x1==r2_x3 && r1_y1==r2_y3)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;
else
    sol=intersection_check(r1_x4,r1_y4,r1_x1,r1_y1,r2_x2,r2_y2,r2_x3,r2_y3);
    if max(r2_x2,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x2,r2_x3) && max(r2_y2,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y2,r2_y3)
        if max(r1_x1,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x1,r1_x4) && max(r1_y1,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y1,r1_y4)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x4==r2_x3 && r1_y4==r2_y3) || (r1_x4==r2_x4 && r1_y4==r2_y4)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;    
elseif (r1_x1==r2_x3 && r1_y1==r2_y3) || (r1_x1==r2_x4 && r1_y1==r2_y4)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;
else
    sol=intersection_check(r1_x4,r1_y4,r1_x1,r1_y1,r2_x3,r2_y3,r2_x4,r2_y4);
    if max(r2_x4,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x3) && max(r2_y4,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y3)
        if max(r1_x1,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x1,r1_x4) && max(r1_y1,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y1,r1_y4)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

if (r1_x4==r2_x4 && r1_y4==r2_y4) || (r1_x4==r2_x1 && r1_y4==r2_y1)
    IntersectionArray_X(end+1)=r1_x4;
    IntersectionArray_Y(end+1)=r1_y4;    
elseif (r1_x1==r2_x4 && r1_y1==r2_y4) || (r1_x1==r2_x1 && r1_y1==r2_y1)
    IntersectionArray_X(end+1)=r1_x1;
    IntersectionArray_Y(end+1)=r1_y1;
else
    sol=intersection_check(r1_x4,r1_y4,r1_x1,r1_y1,r2_x4,r2_y4,r2_x1,r2_y1);
    if max(r2_x4,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r2_x4,r2_x1) && max(r2_y4,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r2_y4,r2_y1)
        if max(r1_x1,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x1,r1_x4) && max(r1_y1,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y1,r1_y4)
            IntersectionArray_X(end+1)=round(sol(1),2);
            IntersectionArray_Y(end+1)=round(sol(2),2);
            plot(round(sol(1),2),round(sol(2),2),'r*','MarkerSize',3);
            hold on
        end
    end
end

%% finding the 1st point of quad2 is lying inside the 1st quadriateral or not
Dummy_X=[];
Dummy_y=[];
x0=21;
y0=r2_y1;

sol=intersection_check(r1_x1,r1_y1,r1_x2,r1_y2,r2_x1,r2_y1,x0,y0);
if max(x0,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x1) && max(y0,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y1)
    if max(r1_x2,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x2,r1_x1) && max(r1_y2,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y2,r1_y1)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x2,r1_y2,r1_x3,r1_y3,r2_x1,r2_y1,x0,y0);
if max(x0,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x1) && max(y0,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y1)
    if max(r1_x3,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x3,r1_x2) && max(r1_y3,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y3,r1_y2)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x3,r1_y3,r1_x4,r1_y4,r2_x1,r2_y1,x0,y0);
if max(x0,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x1) && max(y0,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y1)
    if max(r1_x4,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x4,r1_x3) && max(r1_y4,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y4,r1_y3)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x4,r1_y4,r1_x1,r1_y1,r2_x1,r2_y1,x0,y0);
if max(x0,r2_x1)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x1) && max(y0,r2_y1)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y1)
    if max(r1_x1,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x1,r1_x4) && max(r1_y1,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y1,r1_y4)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

% Remove the repeatation of intersection points from dummay
for i=1:length(Dummy_X)-1
    for j=i+1:length(Dummy_X)
        if Dummy_X(i)==Dummy_X(j) && Dummy_y(i)==Dummy_y(j)
            Dummy_X(j)=Inf;
            Dummy_y(j)=Inf;
        end
    end
end
Dummy_X1=[];
Dummy_y1=[];
for i=1:length(Dummy_X)
    if Dummy_X(i) ~= Inf
        Dummy_X1(end+1)=Dummy_X(i);
        Dummy_y1(end+1)=Dummy_y(i);
    end
end
if rem(length(Dummy_X1),2)~=0
    IntersectionArray_X(end+1)=r2_x1;
    IntersectionArray_Y(end+1)=r2_y1;
    plot(r2_x1,r2_y1,'r*','MarkerSize',3);
    hold on
end

%% finding the 2nd point of quad2 is lying inside the 1st quadriateral or not
Dummy_X=[];
Dummy_y=[];
x0=21;
y0=r2_y2;

sol=intersection_check(r1_x1,r1_y1,r1_x2,r1_y2,r2_x2,r2_y2,x0,y0);
if max(x0,r2_x2)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x2) && max(y0,r2_y2)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y2)
    if max(r1_x2,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x2,r1_x1) && max(r1_y2,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y2,r1_y1)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x2,r1_y2,r1_x3,r1_y3,r2_x2,r2_y2,x0,y0);
if max(x0,r2_x2)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x2) && max(y0,r2_y2)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y2)
    if max(r1_x3,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x3,r1_x2) && max(r1_y3,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y3,r1_y2)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x3,r1_y3,r1_x4,r1_y4,r2_x2,r2_y2,x0,y0);
if max(x0,r2_x2)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x2) && max(y0,r2_y2)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y2)
    if max(r1_x4,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x4,r1_x3) && max(r1_y4,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y4,r1_y3)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x4,r1_y4,r1_x1,r1_y1,r2_x2,r2_y2,x0,y0);
if max(x0,r2_x2)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x2) && max(y0,r2_y2)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y2)
    if max(r1_x1,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x1,r1_x4) && max(r1_y1,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y1,r1_y4)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

% Remove the repeatation of intersection points from dummay
for i=1:length(Dummy_X)-1
    for j=i+1:length(Dummy_X)
        if Dummy_X(i)==Dummy_X(j) && Dummy_y(i)==Dummy_y(j)
            Dummy_X(j)=Inf;
            Dummy_y(j)=Inf;
        end
    end
end
Dummy_X1=[];
Dummy_y1=[];
for i=1:length(Dummy_X)
    if Dummy_X(i) ~= Inf
        Dummy_X1(end+1)=Dummy_X(i);
        Dummy_y1(end+1)=Dummy_y(i);
    end
end
if rem(length(Dummy_X1),2)~=0
    IntersectionArray_X(end+1)=r2_x2;
    IntersectionArray_Y(end+1)=r2_y2;
    plot(r2_x2,r2_y2,'r*','MarkerSize',3);
    hold on
end

%% finding the 3rd point of quad2 is lying inside the 1st quadriateral or not
Dummy_X=[];
Dummy_y=[];
x0=21;
y0=r2_y3;

sol=intersection_check(r1_x1,r1_y1,r1_x2,r1_y2,r2_x3,r2_y3,x0,y0);
if max(x0,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x3) && max(y0,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y3)
    if max(r1_x2,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x2,r1_x1) && max(r1_y2,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y2,r1_y1)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x2,r1_y2,r1_x3,r1_y3,r2_x3,r2_y3,x0,y0);
if max(x0,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x3) && max(y0,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y3)
    if max(r1_x3,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x3,r1_x2) && max(r1_y3,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y3,r1_y2)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x3,r1_y3,r1_x4,r1_y4,r2_x3,r2_y3,x0,y0);
if max(x0,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x3) && max(y0,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y3)
    if max(r1_x4,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x4,r1_x3) && max(r1_y4,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y4,r1_y3)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x4,r1_y4,r1_x1,r1_y1,r2_x3,r2_y3,x0,y0);
if max(x0,r2_x3)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x3) && max(y0,r2_y3)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y3)
    if max(r1_x1,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x1,r1_x4) && max(r1_y1,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y1,r1_y4)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

% Remove the repeatation of intersection points from dummay
for i=1:length(Dummy_X)-1
    for j=i+1:length(Dummy_X)
        if Dummy_X(i)==Dummy_X(j) && Dummy_y(i)==Dummy_y(j)
            Dummy_X(j)=Inf;
            Dummy_y(j)=Inf;
        end
    end
end
Dummy_X1=[];
Dummy_y1=[];
for i=1:length(Dummy_X)
    if Dummy_X(i) ~= Inf
        Dummy_X1(end+1)=Dummy_X(i);
        Dummy_y1(end+1)=Dummy_y(i);
    end
end
if rem(length(Dummy_X1),2)~=0
    IntersectionArray_X(end+1)=r2_x3;
    IntersectionArray_Y(end+1)=r2_y3;
    plot(r2_x3,r2_y3,'r*','MarkerSize',3);
    hold on
end

%% finding the 4th point of quad2 is lying inside the 1st quadriateral or not
Dummy_X=[];
Dummy_y=[];
x0=21;
y0=r2_y4;

sol=intersection_check(r1_x1,r1_y1,r1_x2,r1_y2,r2_x4,r2_y4,x0,y0);
if max(x0,r2_x4)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x4) && max(y0,r2_y4)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y4)
    if max(r1_x2,r1_x1)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x2,r1_x1) && max(r1_y2,r1_y1)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y2,r1_y1)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x2,r1_y2,r1_x3,r1_y3,r2_x4,r2_y4,x0,y0);
if max(x0,r2_x4)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x4) && max(y0,r2_y4)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y4)
    if max(r1_x3,r1_x2)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x3,r1_x2) && max(r1_y3,r1_y2)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y3,r1_y2)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x3,r1_y3,r1_x4,r1_y4,r2_x4,r2_y4,x0,y0);
if max(x0,r2_x4)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x4) && max(y0,r2_y4)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y4)
    if max(r1_x4,r1_x3)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x4,r1_x3) && max(r1_y4,r1_y3)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y4,r1_y3)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

sol=intersection_check(r1_x4,r1_y4,r1_x1,r1_y1,r2_x4,r2_y4,x0,y0);
if max(x0,r2_x4)>=round(sol(1),2) && round(sol(1),2)>=min(x0,r2_x4) && max(y0,r2_y4)>=round(sol(2),2) && round(sol(2),2)>=min(y0,r2_y4)
    if max(r1_x1,r1_x4)>=round(sol(1),2) && round(sol(1),2)>=min(r1_x1,r1_x4) && max(r1_y1,r1_y4)>=round(sol(2),2) && round(sol(2),2)>=min(r1_y1,r1_y4)
        Dummy_X(end+1)=round(sol(1),2);
        Dummy_y(end+1)=round(sol(2),2);
    end
end

% Remove the repeatation of intersection points from dummay
for i=1:length(Dummy_X)-1
    for j=i+1:length(Dummy_X)
        if Dummy_X(i)==Dummy_X(j) && Dummy_y(i)==Dummy_y(j)
            Dummy_X(j)=Inf;
            Dummy_y(j)=Inf;
        end
    end
end
Dummy_X1=[];
Dummy_y1=[];
for i=1:length(Dummy_X)
    if Dummy_X(i) ~= Inf
        Dummy_X1(end+1)=Dummy_X(i);
        Dummy_y1(end+1)=Dummy_y(i);
    end
end
if rem(length(Dummy_X1),2)~=0
    IntersectionArray_X(end+1)=r2_x4;
    IntersectionArray_Y(end+1)=r2_y4;
    plot(r2_x4,r2_y4,'r*','MarkerSize',3);
    hold on
end

%% Remove the repeatation of intersection points
for i=1:length(IntersectionArray_X)-1
    for j=i+1:length(IntersectionArray_X)
        if IntersectionArray_X(i)==IntersectionArray_X(j) && IntersectionArray_Y(i)==IntersectionArray_Y(j)
            IntersectionArray_X(j)=Inf;
            IntersectionArray_Y(j)=Inf;
        end
    end
end
IntersectionArray_X1=[];
IntersectionArray_Y1=[];
for i=1:length(IntersectionArray_X)
    if IntersectionArray_X(i) ~= Inf
        IntersectionArray_X1(end+1)=IntersectionArray_X(i);
        IntersectionArray_Y1(end+1)=IntersectionArray_Y(i);
    end
end

%% IOU Calculation
if length(IntersectionArray_X1) > 2
    Area_Quad1=(1/2)*(abs(r1_x1*r1_y2+r1_x2*r1_y3+r1_x3*r1_y4+r1_x4*r1_y1-r1_y1*r1_x2-r1_y2*r1_x3-r1_y3*r1_x4-r1_y4*r1_x1));
    Area_Quad2=(1/2)*(abs(r2_x1*r2_y2+r2_x2*r2_y3+r2_x3*r2_y4+r2_x4*r2_y1-r2_y1*r2_x2-r2_y2*r2_x3-r2_y3*r2_x4-r2_y4*r2_x1));
    IntersectionArray_X1(end+1)=IntersectionArray_X1(1);
    IntersectionArray_Y1(end+1)=IntersectionArray_Y1(1);
    Area_Intersection=0;
    for i=1:length(IntersectionArray_X1)-1
        Area_Intersection=Area_Intersection+IntersectionArray_X1(i)*IntersectionArray_Y1(i+1)-IntersectionArray_Y1(i)*IntersectionArray_X1(i+1);
    end
    Area_Intersection=abs(Area_Intersection)/2;
    IOU=Area_Intersection/(Area_Quad1+Area_Quad2-Area_Intersection)
else
    IOU=0
    disp('No overlapping or the overlapping points are less than 3')
end