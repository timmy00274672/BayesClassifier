%{
	Gaussian function evaluation.

	Computes the value of the Gaussian distribution N(m,S), at a given vector x	
%}

function z=comp_gauss_dens_val(m,S,x)
	[l,q]=size(m); % l=dimensionality
	z=(1/((2*pi)^ (l/2)*det(S)^ 0.5) )...
		*exp(-0.5*(x-m)'*inv(S)*(x-m));
end