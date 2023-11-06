% plot SBR as a function of depth between 2PM and 3PM 
% 11/6/23 code last updated, SNR measurements made by Jack Giblin

clear
%load in data
load('/Users/naomishvedov/Documents/GitHub/3PM-in-ZFs/Poster-data/SBRmeasurements/SNR_2p.mat');
load('/Users/naomishvedov/Documents/GitHub/3PM-in-ZFs/Poster-data/SBRmeasurements/SNR_3p.mat');


figure(1)
plot(SNR_2p.VarName1*100,SNR_2p.CellToBR,'LineWidth',2,'Color',[0,0,0.3])
set(gcf,'color','w'),set(gca,'FontSize',16)
xlabel('Depth (um)')
ylabel('Signal-To-Background (a.u.)')
title('2PM SBR');
ylim([1 14])

figure(2)
plot(SNR_3p.VarName1*100,SNR_3p.CellToBR,'LineWidth',2,'Color','r')
set(gcf,'color','w'),set(gca,'FontSize',16)
xlabel('Depth (um)')
ylabel('Signal-To-Background (a.u.)')
title('3PM SBR');
ylim([1 14])