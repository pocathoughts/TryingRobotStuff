function [ time,y,vy ] = TA( fileName, vyo, cor, bounces )
g = 9.81;
y = [];
vy = vyo;
clock = 0;
time = 0;

while bounces>0
    clock = clock + 0.001;
    time = time + 0.001;
    position = 0.5*g*clock.*clock + vyo*clock;
    vy = vy -0.001*g;
    if position<0
        vy = -1*vy*cor;
        clock = 0;
        position = 0;
        bounces = bounces - 1;
    end
    y = [y position];
end

subplot(2,1,1);
plot(y,time);
axis([0 10 0 10])
title('Position of a Bouncy Ball');
ylabel('Vertical Position (m)');
xlabel('Time (s)');
subplot(2,1,2);
plot(vy, time);
axis([0 10 0 10])
title('Velocity of a Bouncy Ball');
ylabel('Velocity (m/s)');
xlabel('Time (s)');


dlmwrite(fileName,[time' y' vy'],'delimiter','\t','precision','%0.4f');

end