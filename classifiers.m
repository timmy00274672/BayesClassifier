clc,clear;
m = [1 1; 14 7; 16 1]';
S =[];
temp = [5 3;3 4];
P = [];
N=3; %# class
SampleNumber = input('The number of sample to be generated:');
for i=1:N
	S(:,:,i) = temp;
    P(i) = 1/N; 
end


display(['generate ' num2str(SampleNumber) ' samples']);
display(['There are ' num2str(N) ' classes.' ]);
display('X is the samples.');
display('y is the class number corresponging to the X');

[X,y] = generate_gauss_classes(m,S,P,SampleNumber);

plot_data(X,y,m);
input('check the plot, press any enter to continue');

% Do Bayes classification
yBayesian = bayes_classifier(m,S,P,X);
temp = y -yBayesian;
temp(temp ~=0 ) = 1;
missBayesian =  sum(temp);
clear temp;
display(['Use Bayesian classification rule to classify, the miss rate is :' num2str(missBayesian / SampleNumber )]);

% Do Euclidean classification
yEuclidean = euclidean_classifier(m,X);
temp = y - yEuclidean;
temp(temp ~= 0) =1;
missEuclidean = sum(temp);
clear temp;
display(['Use Euclidean Bayesian classification rule to classify, the miss rate is :' num2str(missEuclidean / SampleNumber )]);

% Do Mahalanobis classification 
yMahalanobis = mahalanobis_classifier(m,S,X);
temp = y - yMahalanobis;
temp(temp ~= 0) =1;
missMahalanobis = sum(temp);
clear temp;
display(['Use Mahalanobis Bayesian classification rule to classify, the miss rate is :' num2str(missMahalanobis / SampleNumber )]);

%Do KNN classification
yKnn = k_nn_classifier(m,[1 2 3], 2, X);
temp = y - yKnn;
temp(temp ~= 0) = 1;
missKnn = sum(temp);
clear temp;
display(['Use Mahalanobis KNN classification rule to classify, the miss rate is :' num2str(missKnn / SampleNumber )]);

clear temp;
clear N;