%% decode function
% y is the signal received
% h is codewords
% nbr_users = number of users in total

function s = decode(y, h, nbr_users)
    y = max(0, round(y));
    s = zeros(nbr_users, 1);

    c_max = 2^nbr_users-1;
    for i = 1:c_max
        % Convert decimal numbers to binary arrays
        c_add = dec2bin(i, nbr_users); 
        c_add = split(c_add, ""); 
        c_add = cell2mat(c_add); 
        c_add = str2num(c_add); 

        s = c_add;
        comb = ismember(s, 1);
        super = sum(h(comb, :));
        if super == y
            break;
        end
    end
    disp("signal decoded(^T) = ");disp(s');
end


