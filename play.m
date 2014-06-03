function out = play(s, fs, alfa, echo, reverb, dist)
    
    [~,b] = size(s);

    %s(1,1) = 1;
    %s(1,2) = 1;
    %for i = 2:a
        %s(i,1) = 0;
        %s(i,2) = 0;
    %end
    
    if echo
        if b == 1
            s = ech(s, alfa, floor(32000*echo));
        else
            s(:,1) = ech(s(:,1), alfa, floor(32000*echo));
            s(:,2) = ech(s(:,2), alfa, floor(32000*echo));
        end
    end
    
    if reverb
        if b == 1
            s = rever(s, alfa, floor(8000*reverb));
        else
            s(:,1) = rever(s(:,1), alfa, floor(8000*reverb));
            s(:,2) = rever(s(:,2), alfa, floor(8000*reverb));
        end
    end
    
    if dist
        if b == 1
            s = distortion(s, dist);
        else
            s(:,1) = distortion(s(:,1), dist);
            s(:,2) = distortion(s(:,2), dist);
        end
    end 
    
    sound(s, fs)
    out = s;
end