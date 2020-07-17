i= 1;
tempx(i,:)= M1EyeX_(i,:);
tempy(i,:)= M1EyeY_(i,:);
k=1:1:12000;
subplot(2,1,1);
plot(k,tempx(i,:),'r',k,tempy(i,:),'b');
legend('x coordinate','y coordinate');
for j=1:12000
    if tempy(i,j)>10
        if tempy(i,j-1)<10
            timexy(i,j)=j;
            start= timexy(i,j);
        end
        if tempy(i,j+1)<10
            timexy(i,j)=j;
            finish= timexy(i,j);
            range=finish-start;  
            for m=start-50:finish+90
                tempx(i,m)=NaN;
                tempy(i,m)=NaN;
            end
        end
        
    end
end  
subplot(2,1,2);
plot(k,tempx(i,:),'r',k,tempy(i,:),'b');
legend('x coordinate','y coordinate');

kernel=[-1,-1,0,1,1];
kernel=kernel*1000/6;

x=sgolayfilt(tempx(i,:),3,11);
y=sgolayfilt(tempy(i,:),3,11);
% x=imgaussfilt(tempx(i,:),5);
% y=imgaussfilt(tempy(i,:),5);
vx=conv(x,kernel,'same');
vy=conv(y,kernel,'same');

vX(i,:)=vx;
vY(i,:)=vy;

% vx is a vector that computes the x-velocities for that trial, similarly vy
% vX is a matrix that will store the x velocities for all the trials, similarly vY

for j=1:12000
    v(i,j)= sqrt(vX(i,j)*vX(i,j) + vY(i,j)*vY(i,j));
    dis(i,j)= sqrt(tempx(i,j)*tempx(i,j) + tempy(i,j)*tempy(i,j));
    if dis(i,j)>10 || v(i,j)>900 
        v(i,j)= NaN;
    end
end


% %I have considered a displacement threshold value of 10 deg and velocity
%900 deg/sec

v(i,:)= imgaussfilt(v(i,:),5);
dis(i,:)=imgaussfilt(dis(i,:),5);
subplot(2,1,1);
plot(k,v(i,:),'b');
legend('Velocity');
subplot(2,1,2);
plot(k,dis(i,:),'r');
legend('Displacement');

