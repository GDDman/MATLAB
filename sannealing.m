% Josh Liu ID: 260612384

startpoints = [0:1:10];
intervals = [0.01:0.01:0.1];
temperatures = [100 200 300];
factors = [0.99 0.88 0.77];
Maxiterations = 1000;

for t = temperatures 
  for a = factors
      for s = startpoints
        if (s~= 0)
            M1 = sprintf('\nFor Starting point %d, temp: %f, a: %f\n', s, t, a);
            disp(M1);
        end
        temp = t;
        for i = intervals
            x = s;
            y = f(x);
            ymax = y;
            xmax = x;
            for j = 1:Maxiterations 
                xp = 0;
                r = rand;
                if (r < 0.5) 
                    xp = x - i;
                    if (xp < 0)
                        continue;
                    end
                else 
                    xp = x + i;
                    if (xp > 10) 
                        continue;
                    end
                end              
                yp = f(xp);            
                if (yp > ymax) 
                    ymax = yp;
                    xmax = xp;
                end
                if (yp >= y) 
                    y = yp;
                    x = xp;
                else 
                    b = boltzprob(temp, yp, y);
                    r = rand;
                    if (b <= rand)
                        x = xp;
                        y = yp;
                    end          
                end
                temp = temp*a;
            end   
            
            if (s ~= 0 && ymax >= 0.9) 
                M2 = sprintf('Interval: %f     Steps: %3.0f     Max Point: (%f,%f)', i, Maxiterations, xmax, ymax);
                disp(M2);
            end
        end
     end
  end
end
