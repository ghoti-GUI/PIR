%% set codebook and encode

% y = superposition signal
% h = codebook
% s = signal generated

% nbr_users = number of users in total
% mode_noise = "Withnoise" or "nonoise"


function [y, h, s] = encode(nbr_users, mode_noise)

    s = randi([0, 1], nbr_users, 1);

    h = set_codewords(nbr_users); % set codewords information of users
    h = h.cinfo.codewords;

    if mode_noise == "Withnoise"
        w = set_noise(size(h, 2)); 
        y = sum(s.*h) + w;
        disp("noise = ");disp(w);
    elseif mode_noise == "Nonoise"
        y = sum(s.*h);
    end
    
    disp("Generate signals: ");
    disp("codewords = "); disp(h);
    disp("signal generated(^T) = "); disp(s');
    disp("superposition code = "); disp(y);
end


function w = set_noise(n)
    w = [];
    for i = 1:n
        w = [w, random("Normal", 0, 0.1)];
    end
end
