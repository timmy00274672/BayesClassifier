%{
	@param m is an l*c matrix,the i-th column of which is the mean vector of the
		i-th class distribution.
	@param S is an l*l*c(three-dimensional) matrix, whose ith two-dimensional
		l*l component is the covariance of the distribution of the ith class.
        In MATLABS(:,:,i) denotes the i-th two-dimensional l*l matrix of S.
	@param P is the c dimensional vector that contains the a priori probabilities of
		the classes. mi, Si , Pi, and c are provided as inputs.
	@param N is the number of vectors should be generated
	@return [X , y]
		X : with (approximately) N columns, each column of which is an l-dimensional data vector.
		y : A row vector whose ith entry denotes the class from which the ith data vector stems. 
%}
function [X,y]=generate_gauss_classes(m,S,P,N)
    [l,c]=size(m);
    X=[];
    y=[];
    for j=1:c
        % Generating the [p(j)*N)] vectors from each distribution
        t=mvnrnd(m(:,j),S(:,:,j),fix(P(j)*N));
        % The total number of points may be slightly less than N
        % due to the fix operator
        X=[X t'];
        y=[y ones(1,fix(P(j)*N))*j];
    end
end