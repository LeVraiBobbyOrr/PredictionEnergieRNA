clc;clear;
%% Importation des données
Data = table2array(readtable("Folds5x2_pp.xlsx"));
Input = Data(:,1:4);
Output = Data(:,5);

%% Nomalisation des données
InputNorm = normalize(Input,'range');
OutputNorm = normalize(Output,'range');

InputNorm2 = InputNorm(1:2000, 1:4);
OutputNorm2 = OutputNorm(1:2000);

%% Arrangement des données pour prédiction 1h
InputNormPred1 = zeros(floor(9568/6),9);
OutputNormPred1 = zeros(floor(9568/6),1);
for i = 1:9568/2
    InputNormPred1(i,1:9) = [InputNorm(i,1:4),OutputNorm(i),InputNorm(i+1,1:4)];
    OutputNormPred1(i) = OutputNorm(i+1);
    i=i+2;
end

%% Arrangement des données pour prédiction 6h
InputNormPred6 = zeros(floor(9568/6),29);
OutputNormPred6 = zeros(floor(9568/6),1);
for i = 1:floor(9568/6)
    InputNormPred6(i,1:29) = [InputNorm(i,1:4),OutputNorm(i),InputNorm(i+1,1:4),OutputNorm(i+1),InputNorm(i+2,1:4),OutputNorm(i+2),InputNorm(i+3,1:4),OutputNorm(i+3),InputNorm(i+4,1:4),OutputNorm(i+4),InputNorm(i+5,1:4)];
    OutputNormPred6(i) = OutputNorm(i+1);
    i=i+6;
end

%% Arrangement des données pour prédiction 24h
InputNormPred24 = zeros(floor(9568/24),119);
OutputNormPred24 = zeros(floor(9568/24),1);
for i = 1:floor(9568/24)
    InputNormPred24(i,1:119) = [InputNorm(i,1:4),OutputNorm(i),InputNorm(i+1,1:4),OutputNorm(i+1),
        InputNorm(i+2,1:4),OutputNorm(i+2),InputNorm(i+3,1:4),OutputNorm(i+3),InputNorm(i+4,1:4),OutputNorm(i+4),
        InputNorm(i+5,1:4),OutputNorm(i+5),InputNorm(i+6,1:4),OutputNorm(i+6),InputNorm(i+7,1:4),OutputNorm(i+7),
        InputNorm(i+8,1:4),OutputNorm(i+8),InputNorm(i+9,1:4),OutputNorm(i+9),InputNorm(i+10,1:4),OutputNorm(i+10),
        InputNorm(i+11,1:4),OutputNorm(i+11),InputNorm(i+12,1:4),OutputNorm(i+12),InputNorm(i+13,1:4),OutputNorm(i+13),
        InputNorm(i+14,1:4),OutputNorm(i+14),InputNorm(i+15,1:4),OutputNorm(i+15),InputNorm(i+16,1:4),OutputNorm(i+16),
        InputNorm(i+17,1:4),OutputNorm(i+17),InputNorm(i+18,1:4),OutputNorm(i+18),InputNorm(i+19,1:4),OutputNorm(i+19),
        InputNorm(i+20,1:4),OutputNorm(i+20),InputNorm(i+21,1:4),OutputNorm(i+21),InputNorm(i+22,1:4),OutputNorm(i+22),
        InputNorm(i+23,1:4)];
    OutputNormPred24(i) = OutputNorm(i+23);
    i=i+24;
end