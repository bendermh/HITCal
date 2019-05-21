function outdat = multifitmatA(xymat, nleave, detcutoff)
% Given a data set stored in the matrix xymat, where x values
% are stored in the first column, and y values are stored in
% the second column, assume that one straight line can be fitted to y
% versus x for x <= x0 (where x0 is currently unknown), and another 
% straight line can be fitted to y versus x for x >= x0.
% Also assume these lines intersect at the one point (x0, y0),
% where y0 is currently unknown.
% Solve for x0 and y0 and fit the two regression lines to y versus x
% using the function twolineOLS().  This uses a least-squares
% algorithm given to us by Andrew Bradshaw at RPAH (run ordinary least
% squares regression for varying values of x0: use the value of x0
% which has minimal cost function J).
% detcutoff: This is passed on to the function twolineOLS.  Typically set
% to a small value, e.g. 0.005.  If the determinant of the matrix
% calculated by twolineOLS is less than detcutoff, we discard that
% solution.
% nleave: We only consider possible values of x0 between x(nleave)
% and x(length(x)-nleave)
% Functions required: multifitmatA.m (this function), twolineOLS.m, absdet.m
	x = xymat(:,1);
	y = xymat(:,2);
% We want x to be monotonically increasing, also for there to be no NaNs
% in y.
	if x(2) < x(1)
% Reverse order of elements in x and y if necessary
		xin = flipud(x(find(~isnan(y))));
		yin = flipud(y(find(~isnan(y))));
	else
% Just remove the NaNs, no reversing needed
		xin = x(find(~isnan(y)));
		yin = y(find(~isnan(y)));
	end
% Add correction 1 September 2005: define nx!
	nx = max(size(xin));
% Initialise a vector containing x values in between each
% of the x data values in the range nleave:(nx-nleave)
% Do this by calculating the mean of the two x values on
% either side for each point.
	x0vec = 0.5*(xin(nleave:(nx-nleave-1)) + ...
				xin((nleave+1):(nx-nleave)));
% Initialise the vector containing cost function
% over the same x range
	outJ = x0vec + NaN;
% Insert a FOR loop to test out each possible value of x0
% (the cutoff value)
% Number of possible solutions
	nsol = max(size(x0vec));
% Initialise vector of work-function values
	outJ = ones(1,nsol) + NaN;
	for ixx = 1:nsol,
		outval = twolineOLS(xin, yin, x0vec(ixx), detcutoff);
% Vector containing the cost-function values
		outJ(ixx) = outval.J;
	end
% From outJ find the value of x0vec corresponding to the minimum
% cost function (outJ) value
% Find the minimum possible cost function
	outJmin = min(outJ(find(~isnan(outJ))));
% Find the value of x0vec corresponding to this minimum
	x0min = x0vec(find(outJ == outJmin));
% Given this minimum value, rerun the two least-squares fits
% to find the gradients and intercepts of the two regression lines
% We just want to use the first value of x0min
	if isnan(x0min(1))
		outdat = NaN;
	else
		outdat = twolineOLS(xin, yin, x0min(1), detcutoff);
	end
end
