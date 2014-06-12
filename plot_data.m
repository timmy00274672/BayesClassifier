%{
	Plot of data. 
	- The data vectors of X using a different color for each class
	- The mean vectors of the class distributions
	
	@assumption The data live in the two-dimensional space.
	@assumption The input data should be less or equal to 6 classes.

	@param X : with (approximately) N columns, each column of which is an l-dimensional data vector.
	@param y : A row vector whose ith entry denotes the class from which the ith data vector stems.
	@param m : the mean vectors of c class distributions
%}
function plot_data(X,y,m)
	[l,N]=size(X); % N=no. of data vectors, l=dimensionality
	[l,c]=size(m); % c=no. of classes
	if(l ~= 2)
		fprintf('NO PLOT CAN BE GENERATED\n')
		return
	else
		pale=['r.'; 'g.'; 'b.'; 'y.'; 'm.'; 'c.'];
		figure(1)
		% Plot of the data vectors
		hold on
		for i=1:N
			plot(X(1,i),X(2,i),pale(y(i),:))
		end
		% Plot of the class means
		for j=1:c
			plot(m(1,j),m(2,j),'k+')
		end
end