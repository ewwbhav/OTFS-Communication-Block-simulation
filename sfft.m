function x_kl = sfft(X_nm)
    x_kl = ifft(X_nm, [], 2);   % IFFT on Delay (columns)
    x_kl = fft(x_kl, [], 1);    % FFT on Doppler (rows)
end
