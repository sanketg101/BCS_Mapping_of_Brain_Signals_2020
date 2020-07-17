%A code that gives the dot plot for x-t and y-t graphs
i= 5;
tempx(i,:)= M1EyeX_(i,:);
tempy(i,:)= M1EyeY_(i,:);

k=1:1:12000;
subplot(2,1,1);
plot(k,tempx(i,:),'.');
legend('x coordinate');
subplot(2,1,2);
plot(k,tempy(i,:),'.');
legend('y coordinate');



