function out = binary2decimal(a)
    out = zeros(length(a),1);
    for j = 1:length(a)
        for i = 0:15
            if (i == 0)
                out(j) = out(j) - (str2double(a(j,1))*2^15);
            else
                out(j) = out(j) + (str2double(a(j,i+1))* 2^(15-i));
        
            end
        end
    end
end
