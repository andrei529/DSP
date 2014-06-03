function out = distortion(s, alfa)
    
    %mix = 0.5; outra distortion, que nao funcionou tao bem
    %q = s*alfa/max(abs(s));
    %z = sign(-q).*(1-exp(sign(-q).*q));
    %out = mix*z*max(abs(s))/max(abs(z))+(1-mix)*s;
    %out = out*max(abs(s))/max(abs(out));
    
    if alfa == 1
        alfa = 0.99;
    end
    k = 2*alfa/(1-alfa);
    out = (1+k)*(s)./(1+k*abs(s));
    
    return;
end