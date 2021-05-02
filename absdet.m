function outval = absdet(M)
% Translated from S-Plus function absdet()
	outval = prod(svd(M));
end
