% Josh Liu ID: 260612384

startpoints = [0:1:10];
intervals = [0.01:0.01:0.1];

for s = startpoints
    M1 = sprintf('\nFor Starting point %d:\n', s);
    disp(M1);
    for i = intervals
        steps = 0;
        x = s;
        y = f(x);
        while(true) 
            x1 = x - i;
            x2 = x + i;
            y1 = f(x1);
            y2 = f(x2);
            if (x1 < 0)
                y1 = -realmax('double');
            end
            if (x2 > 10)
                y2 = -realmax('double');
            end
            
            if (y > y1 && y > y2)
                break;
            end

            if (y1 > y2)
                y = y1;
                x = x1; 
            else
                y = y2;
                x = x2;
            end

            steps = steps + 1;
        end   
        
        M2 = sprintf('Interval: %f     Steps: %3.0f     Final Point: (%f,%f)', i, steps, x, y);
        disp(M2);
    end
end