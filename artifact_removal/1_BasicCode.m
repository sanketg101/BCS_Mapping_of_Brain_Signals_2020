%A basic code that gives line plot for x-t and y-t graphs and gives the
%time values for the spikes
i= 5;
tempx(i,:)= M1EyeX_(i,:);
tempy(i,:)= M1EyeY_(i,:);

k=1:1:12000;
plot(k,tempx(i,:),'r',k,tempy(i,:),'b');
legend('x coordinate','y coordinate');



for j=1:12000
    if tempy(i,j)>10
        if tempy(i,j-1)<10
            timexy(i,j)=j;
            X=['Beginning at: ',num2str(timexy(i,j)),'ms'];
            disp (X);
            start= timexy(i,j);
        end
        if tempy(i,j+1)<10
            timexy(i,j)=j;
            Y=['End at: ',num2str(timexy(i,j)),'ms'];
            disp (Y);
            finish= timexy(i,j);
            range=finish-start;
            
            if range>150
                Z=['The pulse width is ', num2str(range),'ms. Thus, it is a blink!'];
            else 
                Z=['The pulse width is ', num2str(range),'ms. Thus, it is a saccade!'];
            end
            
            disp (Z);
        end
    end
end    