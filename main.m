% Phased Array Antenna, Radiation Pattern and Array Configuration
% Phased array consisting of N lined up individual isotropic antennas 
% with the composite main antenna beam into vertical direction. 
% This code based on the governing equation (J. Röttger, The Instrumental 
% Principles of MST Radars, Ch.2.1) and shows how the radiation pattern 
% changes as the parameters are modified.

clc; clear all;
close all;

% Ratio between wavelength and distance between individual elements Linear Array of N isotropic radiators

N    = 64;
alfa = -90:0.1:90;       % Zenith angle
d_l  = [0.1,0.5,1,2,5] ; % Ratio
for i = 1:5
    Ed = abs(sin(N*pi*d_l(i)*sind(alfa))./sin(pi*d_l(i)*sind(alfa)))/N;
    fig = figure(i);
    set(fig,'Position', [100, 100, 1049, 400]);
    subplot(2,2,[1 3]);
    plot(alfa,Ed);
    grid on;
    axis([-90 90 0 1]);
    xlabel('Zenith angle [deg]');
    ylabel('Normalized radiation pattern');
    title(['Ratio between distance and wavelength d/\lambda = ',num2str(d_l(i))]);

    subplot(2,2,[2 4]);
    polar(alfa*pi/180,Ed);
    hold on;
    polar((alfa+180)*pi/180,Ed);
    xlabel(['Polar plot for the radiation pattern d/\lambda = ',num2str(d_l(i))]);
    hold off;
end