%% set codebook
% nbr_users = number of users in total

function cw = set_codewords(nbr_users)
    cw.nbits = 6;
    cw.cinfo = random_codewords(cw.nbits, nbr_users);
    cw.cinfo.codewords = cw.cinfo.codewords(1:nbr_users, :, 1);
end
