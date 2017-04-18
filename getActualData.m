clearvars;
clc;

importfile('/Users/SaiBhargavi/Documents/NEU Blackboard/Spl topics AI/Matlab/wiki/wiki.mat')
[age,~]=datevec(datenum(wiki.photo_taken,7,1)-wiki.dob);

% Indexes at which age is greater than 0

fileNamesin00 = data()
indexes = find(ismember(wiki.full_path,fileNamesin00))
path = transpose(wiki.full_path(indexes))
ages = transpose(age(indexes))