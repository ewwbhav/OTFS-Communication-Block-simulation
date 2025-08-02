# OTFS Modulation Simulation in AWGN

This project simulates a digital communication system that uses Orthogonal Time Frequency Space (OTFS) modulation over an Additive White Gaussian Noise (AWGN) channel. The primary goal is to evaluate the system's performance by plotting the Bit Error Rate (BER) against the Signal-to-Noise Ratio (SNR).

## Project Description

The simulation implements the core components of an OTFS system, including:

* 16-QAM modulation and demodulation.
* Key OTFS transforms: Inverse Symplectic Finite Fourier Transform (ISFFT) and Symplectic Finite Fourier Transform (SFFT).
* Addition and removal of a cyclic prefix to handle channel effects.
* Modeling of an AWGN channel.

The final output is a BER vs. SNR plot, which is a standard method for assessing the performance of a digital communication system.

## Files

The project is composed of several MATLAB files:

* **`otfs_awgn_ber.m`**: This is the main script. It orchestrates the entire simulation, from data generation to final plotting.
* **`qam_modulate.m`**: A function that performs 16-QAM modulation on the input data.
* **`isfft.m`**: A function that implements the Inverse Symplectic Finite Fourier Transform, a core component of the OTFS modulator.
* **`sfft.m`**: A function that implements the Symplectic Finite Fourier Transform, used in the OTFS demodulator.
* **`add_cyclic_prefix.m`**: A utility function to add a cyclic prefix to the modulated signal.
* **`remove_cyclic_prefix.m`**: A utility function to remove the cyclic prefix from the received signal before demodulation.

## How to Run

1.  Make sure you have MATLAB installed.
2.  Place all the `.m` files (`otfs_awgn_ber.m`, `qam_modulate.m`, etc.) in the same folder.
3.  Open MATLAB and navigate to the directory where you saved the files.
4.  Run the main simulation script by typing the following command in the MATLAB Command Window:
    ```matlab
    otfs_awgn_ber
    ```
5.  The script will execute the simulation for a range of SNR values and will automatically generate the BER vs. SNR plot.

## License

This project is licensed under the MIT License.
