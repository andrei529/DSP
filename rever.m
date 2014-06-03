function out = rever(s, alfa, N)

    tmp1 = echo(s, alfa, N);
    tmp2 = echo(s, alfa, N);
    tmp3 = echo(s, alfa, N);
    tmp4 = echo(s, alfa, N);
    out = tmp1 + tmp2 + tmp3 + tmp4;
    out = allpass(out, alfa, N);
    out = allpass(out, alfa, N);
    out = out.*(1-alfa);
    
    return;
end

function y = echo(s, alfa, N)
    y = s;
    for n = N+1:length(s)
        y(n) = s(n-N) + alfa*y(n-N);
    end
end

function y = allpass(s, alfa, N)
    y = s;
    for n = N+1:length(s)
        y(n) = alfa*s(n) + s(n-N) - alfa*y(n-N);
    end
end