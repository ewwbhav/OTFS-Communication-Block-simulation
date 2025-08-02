function x_kl = qam_modulate(bits, N, M, M_order)
    symbols = qammod(bits, M_order, 'InputType', 'bit', 'UnitAveragePower', true);
    x_kl = reshape(symbols, N, M);
end
