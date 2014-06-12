%{
    @param Z: a set of N1 vectors packed as columns of a matrix Z(l*N1)
    @param v: an N1-dimensional vector containing the classes where each vector in Z belongs
    @param k: the value for the parameter k of the classifier
    @param X: in which a set of N vectors packed as columns (l*N)
%}

function z=k_nn_classifier(Z,v,k,X)
    [l,N1]=size(Z);
    [l,N]=size(X);
    c=max(v); % The number of classes
    % Computation of the (squared) Euclidean distance
    % of a point from each reference vector
    for i=1:N
        dist=sum((X(:,i)*ones(1,N1)-Z).^ 2);
        %Sorting the above distances in ascending order
        [sorted,nearest]=sort(dist);
        % Counting the class occurrences among the k-closest
        % reference vectors Z(:,i)
        refe=zeros(1,c); %Counting the reference vectors per class
        for q=1:k
            class=v(nearest(q));
            refe(class)=refe(class)+1;
        end
        [val,z(i)]=max(refe);
    end
end

