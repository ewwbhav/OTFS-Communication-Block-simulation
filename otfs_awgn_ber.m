%function otfs_awgn_ber
    N = 16; M = 8;
    M_order = 4;
    CP_len = N / 4;
for ii=1:100

    bits = randi([0 1], N*M*log2(M_order), 1);
    x_kl_tx = qam_modulate(bits, N, M, M_order);

    % Modulate: Delay-Doppler to Time-Frequency
    X_nm = isfft(x_kl_tx);   % ISFFT output

    % Time-domain signal before transmission
    tx_time = ifft(X_nm, [], 2);         % ifft on coulmns
    tx_time_cp = add_cyclic_prefix(tx_time, CP_len);

    SNR_dBs = 1:20;
    BER = zeros(size(SNR_dBs));

    for idx = 1:length(SNR_dBs)
        snr_db = SNR_dBs(idx);

        % Add AWGN in time domain using built-in function
        rx_time_cp = awgn(tx_time_cp, snr_db, 'measured');

        % Remove cyclic prefix
        rx_time = remove_cyclic_prefix(rx_time_cp, CP_len);

        %time -> DD
        X_nm_rx = fft(rx_time, [], 2);       % FFT across columns
        x_kl_rx = sfft(X_nm_rx);             % SFFT

        %demod
        rx_bits = qamdemod(reshape(x_kl_rx, [], 1), M_order,'OutputType', 'bit', 'UnitAveragePower', true);

        bit_errors = sum(bits ~= rx_bits);
        BER(ii,idx) = bit_errors / length(bits);
    end
BER_F=mean(BER)
end
semilogy(SNR_dBs, BER_F);
xlabel('SNR (dB)');
ylabel('Bit Error Rate');
title('OTFS BER vs SNR');
%end
