[s, fs] = wavread('guitar.wav');

%left = s(:,1);
%right = s(:,2);

%time = (1/fs)*length(s);
%plot(linspace(0,time,length(s)), s)
%xlabel('time');
%ylabel('signal strength');

out = s;
N = 10000;
for n=N+1:length(s)
    out(n) = out(n)+0.7*out(n-N);
end

soundsc(out, fs)
