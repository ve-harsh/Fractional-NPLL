clc;
clear;

% === Step 1: Load Data ===
filename = 'mash111-hkefm-data-9bit-a2-reg-new.txt';
y = load("mash111-spefm-i0.5-reg-new.txt"); 

% === Step 2: Convert to double & flatten ===
y = double(y(:));  % Ensure it's a column vector

% === Step 3: Compute Average Value ===
avg_y = mean(y);
fprintf('Average value of output y_o: %.6f\n', avg_y);

% Expected value
expected_alpha = 1/2;
fprintf('Target alpha (15/37): %.6f\n', expected_alpha);
fprintf('Absolute error: %.6f\n\n', abs(avg_y - expected_alpha));

% === Step 4: Plot Output Sequence ===
figure;
plot(y, 'k.');
title('Output Binary Sequence (y_o)');
xlabel('Sample Index');
ylabel('y_o');
grid on;

% === Step 5: Compute & Plot Power Spectral Density (PSD) ===
N = length(y);
Y = fft(y - mean(y), N);      % Remove DC component before FFT
PSD = abs(Y).^2 / N;          % Power spectrum
f = (0:N-1) / N;

% Plot one-sided PSD (normalized)
figure;
plot(f(1:N/2), 10*log10(PSD(1:N/2)));
title('Power Spectral Density (PSD) of Output');
xlabel('Normalized Frequency');
ylabel('Power/Frequency (dB)');
grid on;
