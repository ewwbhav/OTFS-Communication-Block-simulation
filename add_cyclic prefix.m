function x_cp = add_cyclic_prefix(x, CP_len)
    [rows, cols] = size(x);
    x_cp = [x(:, end-CP_len+1:end), x];
end
