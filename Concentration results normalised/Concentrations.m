% Load experimental data
data = csvread('Test3Q175C5000_norm.csv', 1, 0); % Skip the header row
y_D = data(:, 1);     %col 1
U_data = data(:,2:5); %col 2 to 5

% Load CFD data_1
dataCFD = csvread('CFDconc_Test3_Norm.csv', 1, 0); % Skip the header row
y_D_CFD = dataCFD(:, 1:4);     %col 1
U_data_CFD = dataCFD(:,5:8); %col 2 to 5

% Load CFD data_2
%dataCFD2 = csvread('CFDconc_Test3_Norm.csv', 1, 0); % Skip the header row
%y_D_CFD2 = dataCFD2(:, 1:4);     %col 1
%U_data_CFD2 = dataCFD2(:,5:8); %col 2 to 5

% Load CFD data_3
%dataCFD3 = csvread('CFDconc_Test3_Norm.csv', 1, 0); % Skip the header row
%y_D_CFD3 = dataCFD3(:, 1:4);     %col 1
%U_data_CFD3 = dataCFD3(:,5:8); %col 2 to 5

% Prepare and plot the data - each set offset with 0.4 from previous one

del_x=0;
xticklabels = [];
labelT = [0 1 2 3];
xticks=0:1:15; % set according to labelT e.g. 4*4-1

figure;
hold on;

for i = 1:4    %loop through columns i=1=col2, i=8=col9

    U     = U_data(:,i)+del_x;  %del_x = place to plot x value, space 4 from where next plot starts
    U_CFD = U_data_CFD(:,i)+del_x;  %del_x = place to plot x value, space 4 from where next plot starts
    y_D_CFD = dataCFD(:, i);

    %U_CFD2 = U_data_CFD2(:,i)+del_x;  %del_x = place to plot x value, space 4 from where next plot starts
    %y_D_CFD2 = dataCFD2(:, i);

    %U_CFD3 = U_data_CFD3(:,i)+del_x;  %del_x = place to plot x value, space 4 from where next plot starts
    %y_D_CFD3 = dataCFD3(:, i);
    
    del_x=del_x+4;        
    plot(U, y_D,'*','color','red');      %
    plot(U_CFD, y_D_CFD,'LineWidth',1,'color','black');      %

    %plot(U_CFD2, y_D_CFD2,'LineWidth',1,'color','green');      %
    %plot(U_CFD3, y_D_CFD3,'LineWidth',1,'color','purple');      %

    xticklabels=[xticklabels, labelT];  %makes tick marks on x-axis

end

xlim([0, 15]); % set according to xticks and lableT

box on;
title('Test 3','FontSize',18)
legend('experiment','Model','FontSize',18)
legend('Location','northeastoutside')

% Specify the x and y coordinates for the label CS1
label_x1 = 0.8; % Adjust the x-coordinate for the first label
label_y1 = 0.9; % Adjust the y-coordinate for the first label
text(label_x1, label_y1, 'CS1', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom','FontSize',14);

% Specify the x and y coordinates for the label CS2
label_x1 = 3.3; % Adjust the x-coordinate for the first label
label_y1 = 0.9; % Adjust the y-coordinate for the first label
text(label_x1, label_y1, 'CS2', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom','FontSize',14);

% Specify the x and y coordinates for the label CS3
label_x1 = 7.3; % Adjust the x-coordinate for the first label
label_y1 = 0.9; % Adjust the y-coordinate for the first label
text(label_x1, label_y1, 'CS3', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom','FontSize',14);

% Specify the x and y coordinates for the label CS4
label_x1 = 11.3; % Adjust the x-coordinate for the first label
label_y1 = 0.9; % Adjust the y-coordinate for the first label
text(label_x1, label_y1, 'CS4', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom','FontSize',14);

% Adjust x-axis ticks and labels

set(gcf,'color','w');   %plots background white
set(gca,'Xtick',xticks,'Xticklabels',xticklabels,'FontSize',18);

xlabel('C/Cref','FontSize',18);
ylabel('y/D','FontSize',18);



   

