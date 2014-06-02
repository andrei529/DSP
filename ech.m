function out = ech(s, fs, N)
    %left = s(:,1);
    %right = s(:,2);

    %time = (1/fs)*length(s);
    %plot(linspace(0,time,length(s)), s)
    %xlabel('time');
    %ylabel('signal strength');

    out = s;
    for n=N+1:length(s)
        out(n) = out(n)+0.75*out(n-N);
    end
    
    return;
end