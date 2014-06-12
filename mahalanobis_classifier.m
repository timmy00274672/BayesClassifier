%{
	@param m : mean vectors
	@param S : covariance matrices of the c class distributions
	@param X : column vectors that stem from the above classes

	@return z: N-dimensional vector whose ith component contains the class where
		corresponding vector is assigned according to the Mahalanobis classification
		rule.
%}
function z=mahalanobis_classifier(m,S,X)
    [l,c]=size(m); % l=dimensionality, c=no. of classes
    [l,N]=size(X); % N=no. of vectors
    for i=1:N
        for j=1:c
            t(j)=sqrt((X(:,i)-m(:,j))'*inv(S(:,:,j))*...
                (X(:,i)-m(:,j)));
        end
        % Determining the maximum quantity Pi*p(x|wi)
        [num,z(i)]=min(t);
    end
end

