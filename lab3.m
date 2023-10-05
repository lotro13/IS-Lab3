x = 0.1:1/22:1;
y = ((1 + 0.6 * sin (2 * pi * x / 0.7)) + 0.3 * sin (2 * pi * x)) / 2;

hold on
plot(x, y, 'k*', 'MarkerSize', 12)

%2. Tinklo strukturos pasirinkimas
c1 = 0.2; r1 = 0.25;
c2 = 0.9; r2 = 0.25;

%3. Pradiniu parametru pasirinkimas
w1 = rand(1);
w2 = rand(1);
w0 = rand(1);
n = 0.1;

for m = 1:100
    for indx = 1: numel(x)
        F1 =  exp(-(x(indx)-c1)^2/(2*r1^2));
        F2 =  exp(-(x(indx)-c2)^2/(2*r2^2));

        yPredicted = F1*w1 + F2*w2 + w0;

        %5. klaidos skaiciavimas
        e = y(indx) - yPredicted;
        % rysius svoriu atnaujinimas
        w1 = w1 + n*e*F1;
        w2 = w2 + n*e*F2;
        w0 = w0 + n*e;
    end
end

% high resolution grafiko piesimas
for indx = 1: numel(x)
    F1 =  exp(-(x(indx)-c1)^2/(2*r1^2));
    F2 =  exp(-(x(indx)-c2)^2/(2*r2^2));

    yPredicted = F1*w1 + F2*w2 + w0;
    Y(indx) = yPredicted;
end
plot(x, Y, 'r')