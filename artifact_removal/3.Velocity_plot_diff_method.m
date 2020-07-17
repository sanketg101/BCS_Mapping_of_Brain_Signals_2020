%Wrong method for this data
%calculates velocity using the differentiation method
i= 3;
tempx(i,:)= M1EyeX_(i,:);
tempy(i,:)= M1EyeY_(i,:);

tempvx(i,:)= diff(tempx(i,:));
tempvy(i,:)= diff(tempy(i,:));

k= 1:1:11999;
for j=1:11999
    tempv(i,j)=sqrt(tempvx(i,j)*tempvx(i,j) + tempvy(i,j)*tempvy(i,j));
    tempd(i,j)=sqrt(tempx(i,j)*tempx(i,j) + tempy(i,j)*tempy(i,j));
end


tempvfilt1(i,:)=sgolayfilt(tempv(i,:),3,11);
tempvfilt2(i,:)=movmean(tempv(i,:),5);
subplot(2,1,1);
plot(k,tempvfilt1(i,:),'b');
legend('Velocity');
subplot(2,1,2);
plot(k,tempd(i,:),'r');
legend('Displacement');
