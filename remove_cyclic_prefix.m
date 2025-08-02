function x = remove_cyclic_prefix(x_cp, CP_len)
    x = x_cp(:, CP_len+1:end);
end
