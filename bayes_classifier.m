%{
	@param m : mean vectors
	@param S : covariance matrices of the c class distributions
	@param P : priori probabilities of the c classes 
	@param X : column vectors that stem from the above classes

	@return z: N-dimensional vector whose ith component contains the class where
		corresponding vector is assigned according to the Bayesian classification
		rule.
%}

function z=bayes_classifier(m,S,P,X)
	[l,c]=size(m); % l=dimensionality, c=no. of classes
	[l,N]=size(X); % N=no. of vectors
	for i=1:N
		for j=1:c
			t(j)=P(j)*comp_gauss_dens_val(m(:,j),...
			S(:,:,j),X(:,i));
		end
		% Determining the maximum quantity Pi*p(x|wi)
		[num,z(i)]=max(t);
	end
end