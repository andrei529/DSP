function out = ech(s, alfa, N)
    %left = s(:,1);
    %right = s(:,2);

    %time = (1/fs)*length(s);
    %plot(linspace(0,time,length(s)), s)
    %xlabel('time');
    %ylabel('signal strength');

    out = s;
    for n = N+1:length(s)
        out(n) = s(n) + alfa*s(n-N);
    end
    
    return;
end