% plot SBR as a function of depth between 2PM and 3PM 
% 11/6/23 code last updated, SNR measurements made by Jack Giblin

clear
%load in data
load('/Users/naomishvedov/Documents/GitHub/3PM-in-ZFs/Poster-data/SBRmeasurements-Jack/SNR_2p.mat');
load('/Users/naomishvedov/Documents/GitHub/3PM-in-ZFs/Poster-data/SBRmeasurements-Jack/SNR_3pv2.mat');


figure(1)
plot(SNR_2p.VarName1*100,SNR_2p.CellToBR,'LineWidth',2,'Color',[0,0,0.3])
set(gcf,'color','w'),set(gca,'FontSize',16)
xlabel('Depth (um)')
ylabel('Signal-To-Background (a.u.)')
ylim([1 8])
hold on
plot(SNR_3pv2.VarName1*100,SNR_3pv2.CellToBR,'LineWidth',2,'Color','r')
title('SBR');
legend('2PM','3PM')