%{
	@param m : mean vectors
	@param X : column vectors that stem from the above classes

	@return z: N-dimensional vector whose ith component contains the class where
		corresponding vector is assigned according to the Euclidean classification
		rule.
%}

function z=euclidean_classifier(m,X)
    [l,c]=size(m); % l=dimensionality, c=no. of classes
    [l,N]=size(X); % N=no. of vectors
    for i=1:N
	    for j=1:c
	   		t(j)=sqrt((X(:,i)-m(:,j))'*(X(:,i)-m(:,j)));
	    end
	    % Determining the maximum quantity Pi*p(x|wi)
	    [num,z(i)]=min(t);
	end
end
