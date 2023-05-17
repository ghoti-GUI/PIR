%% creat codebook where all possible sum of the codewords in the list is unequal
% nbits = number of bits used to generate each code
% nbr_users = number of users in total

function cinfo = random_codewords(nbits, nbr_users)
    % creat a list including all poossible codes, and select one from it
    c_list = generate_all_code(nbits);
    n = randi([1, size(c_list, 1)]);
    cw_n = c_list(n, :);
    c_list = delete(cw_n, c_list); 

    nbr_users = nbr_users-1;

    if nbr_users == 0
        cinfo.codewords = cw_n;
        cinfo.super = 1;
    else
        [cinfo.codewords, success] = add_codewords(c_list, cw_n, nbits, nbr_users);
    end

    if ~success
        cinfo = random_codewords(nbits+1, nbr_users+1);
    end

end

% to generate all possible codes for 'nbits' bits
function c_list = generate_all_code(nbits)
    c_list = [zeros(1, nbits-1), 1];
    c_max = 2^nbits;
    for i = 2:c_max-1
        % Convert decimal numbers to binary arrays 
        c_add = dec2bin(i, nbits); 
        c_add = split(c_add, ""); 
        c_add = cell2mat(c_add); 
        c_add = str2num(c_add); 
        c_add = c_add'; 
        c_list = [c_list; c_add];
    end
end

function c_rest = delete(c, c_all)
    c_d = ismember(c_all, c, "rows");
    c_rest = c_all(~c_d, :);
end


% to add a new codeword
% nbits = 4;
% init super_cell = [];
function [super, success] = add_codewords(c_list, super_init, nbits, nbr_users)
    super_copy = super_init;
    if ~isempty(c_list)
        c_list_copy = c_list;
        n = randi([1, size(c_list_copy, 1)]);
        cw_n = c_list_copy(n, :);
        c_list_copy = delete(cw_n, c_list_copy);
    else
        super = super_init;
        success = 0;
        return
    end

    [x, y, z] = size(super_copy);
    if z == nbr_users
        z = z-1;
    end

    % Determine if the sum is duplicated with other codes
    i = z;
    while i <= z && i >= 1
        for j = 1:x
            code_added = super_copy(j, :, i);
            if any(code_added)
                super_2 = cw_n + code_added; 
                if ismember_3d(super_2, super_copy) 
                    i = -1;
                    super_copy = super_init;
                    break;
                else
                    super_copy = add_member(super_copy, super_2, i+1);
                end
            else
                break;
            end
        end
        if i == 1
            super_copy = add_member(super_copy, cw_n, i);
            nbr_users = nbr_users-1;
        end
        i = i-1;
    end

    if nbr_users ~= 0
        [super, success] = add_codewords(c_list_copy, super_copy, nbits, nbr_users); 
    else
        super = super_copy;
        success = 1;
    end
end

% to check if a code is the member of the table
function n = ismember_3d(cw_n, super_copy)
    z = size(super_copy, 3);
    n = 0;
    i = 1;
    while i <= z && n == 0
        n = ismember(cw_n, super_copy(:, :, i), "rows");
        i = i+1;
    end
end


% used to add code on the column "n" 
function super = add_member(super,super_2, n)
    [x, y, z] = size(super);
    for i = 1:x
        if z<n || ~any(super(i, :, n))
            super(i, :, n) = super_2;
            break;
        end
        if i == x
            super(i+1, :, n) = super_2;
            break;
        end
    end
end


