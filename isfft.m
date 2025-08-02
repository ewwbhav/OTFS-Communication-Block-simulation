function X_nm = isfft(x_kl)
    X_nm = ifft(x_kl, [], 1);   % IFFT on Doppler (rows)
    X_nm = fft(X_nm, [], 2);    % FFT on Delay (columns)
end
