%% to check if the decoded signal is correct
% s_decoded = signal decoded
% s_init = signal emitted

function check_signal(s_decoded, s_init)
    p = ~xor(s_decoded, s_init);
    p = sum(p)/size(p, 1);
    disp("correction: ");
    if p == 1
        fprintf('\tcorrect\n');
    else
        fprintf('\terror!!!\n');
    end
end