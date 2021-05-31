%% ECG SIGNAL DENOISING

% Plot Ecg Signal
load ('q2_data.mat');
fs=1000;
ts=1/fs;
npts=size(ecg_original,2);
Ts = 1/fs;
time = (0:(npts-1))*Ts;
figure(1);
sgtitle("Original Signals");
subplot(211);
plot(time,ecg_original)
title('Original ECG');
xlabel('Time');
ylabel('Frequency (Hz)');
subplot(212);
plot(time,ecg_original_noisy)
title('Noisy ECG');
xlabel('Time');
ylabel('Frequency (Hz)');

% Plotting the spectrograms
figure(2);
sgtitle("ECG Spectrogram");
subplot(211);
spectrogram(ecg_original,gausswin(400),0,npts,fs,'yaxis');
title('Original ECG Spectrogram');
xlabel('Time');
ylabel('Frequency (Hz)');
subplot(212);
spectrogram(ecg_original_noisy,gausswin(400),0,npts,fs,'yaxis');
title('Noisy ECG');
xlabel('Time');
ylabel('Frequency (Hz)');
%%
% Denoising using Daubechies 1 wavelet
figure(3);
sgtitle('Denoising using Daubechies 1 wavelet','color','red','FontSize',18);
[thr,sorh,keepapp] = ddencmp('den','wv',ecg_original_noisy); 
clean = wdencmp('gbl',ecg_original_noisy,'db1',2,thr,sorh,keepapp);
subplot(3,1,1); 
plot(ecg_original_noisy)
title('Noisy ECG') 
xlabel('Time');
ylabel('Frequency (Hz)');
subplot(3,1,2); 
plot(clean); 
title('Denoised ECG')
xlabel('Time');
ylabel('Frequency (Hz)');
subplot(3,1,3);
plot(ecg_original);
title('Original ECG');
xlabel('Time');
ylabel('Frequency (Hz)');
C=corr(ecg_original(:),clean(:));

%%
% Denoising using Daubechies 2 wavelet
figure(4);
sgtitle('Denoising using Daubechies 2 wavelet','color','red','FontSize',18);
[thr,sorh,keepapp] = ddencmp('den','wv',ecg_original_noisy); 
clean = wdencmp('gbl',ecg_original_noisy,'db2',2,thr,sorh,keepapp);
subplot(3,1,1); 
plot(ecg_original_noisy)
title('Noisy ECG') 
xlabel('Time');
ylabel('Frequency (Hz)');
subplot(3,1,2); 
plot(clean); 
title('Denoised ECG')
xlabel('Time');
ylabel('Frequency (Hz)');
subplot(3,1,3);
plot(ecg_original);
title('Original ECG');
xlabel('Time');
ylabel('Frequency (Hz)');

% Denoising using Symlets 2 wavelet
figure(5);
sgtitle('Denoising using Symlets 2 wavelet','color','red','FontSize',18);
[thr,sorh,keepapp] = ddencmp('den','wv',ecg_original_noisy); 
clean = wdencmp('gbl',ecg_original_noisy,'sym2',2,thr,sorh,keepapp);
subplot(3,1,1); 
plot(ecg_original_noisy)
title('Noisy ECG') 
xlabel('Time');
ylabel('Frequency (Hz)');
subplot(3,1,2); 
plot(clean); 
title('Denoised ECG')
xlabel('Time');
ylabel('Frequency (Hz)');
subplot(3,1,3);
plot(ecg_original);
title('Original ECG');
xlabel('Time');
ylabel('Frequency (Hz)');

% Denoising using Coiflets 5 wavelet
figure(6);
sgtitle('Denoising using Coiflets 5 wavelet','color','red','FontSize',18);
[thr,sorh,keepapp] = ddencmp('den','wv',ecg_original_noisy); 
clean = wdencmp('gbl',ecg_original_noisy,'coif5',2,thr,sorh,keepapp);
subplot(3,1,1); 
plot(ecg_original_noisy)
title('Noisy ECG') 
xlabel('Time');
ylabel('Frequency (Hz)');
subplot(3,1,2); 
plot(clean); 
title('Denoised ECG')
xlabel('Time');
ylabel('Frequency (Hz)');
subplot(3,1,3);
plot(ecg_original);
title('Original ECG');
xlabel('Time');
ylabel('Frequency (Hz)');

















