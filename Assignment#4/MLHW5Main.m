%#####################################################################
%#####################################################################
% Group :           Koppula Kuruba Pattan Uppari
% Students names :  Sri Chakra Goud Koppula
%                   Madan Mohan Kuruba
%                   Nishal Pattan
%                   Raj Kiran Uppari
% M# Numbers :      M12483919 ,M12484276 ,M12484225, M12483927
%#####################################################################
clc;
clear;
%instantiate a new instance of the DataManager class
DM1 = DataManager();
%loading the data
DM1.LoadData();


DH1 = DM1.readyDataEnhanced();
%Epsilon
Epsilon=0;
% Executing SMO
plotData()
Accuracy=smo(DH1.Data_Training(:,(1:4)),DH1.Data_Training(:,5),DH1.Data_Testing(:,(1:4)),DH1.Data_Testing(:,5),Epsilon)