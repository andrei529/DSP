function [] = play(s, fs, echo)
    if echo
        s = ech(s, fs, floor(50000*echo));
    end
    
    soundsc(s, fs)
end