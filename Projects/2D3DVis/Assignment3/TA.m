function [ time,y,vy ] = TA( fileName,v_yo,cor,bounces )
clc;

g = 9.81;

timeflight = 2*v_yo/g;

y = [];

vy = [];

a=0;

while a <= bounces
   for t = 0:.001:timeflight;
    y = [y v_yo*t - .5*g*t.^2];
    vy = [vy v_yo - g*t];
   end
    v_yo = v_yo*cor;
    timeflight = v_yo*2/g;
    a = a+1;
    
end

time = 0:.001:length(y)/1000-.001;
figure,
subplot(2,1,1)
    plot(time,y,'b','LineWidth',3)
    title('Bouncy Ball Simulation')
    xlabel('Time (s)')
    ylabel('Height (m)')

subplot(2,1,2)
    plot(time,vy,'r.','LineWidth',3)
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')
    
savedata = [time;y;vy]';
    
dlmwrite(fileName,savedata,'delimiter','\t', 'precision', '%0.6f');
    

end

