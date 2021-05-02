function outdat = twolineOLS(x, y, x0, detcutoff)
% Called by multifitmatA.m; requires absdet.m
% We are assuming that the data points x, y are fitted by two 
% straight lines that intersect at (x0, y0), where x0 is provided,
% and y0 is to be determined.  Given x0, use ordinary least squares
% to fit the two regression lines.
% detcutoff: reject solutions for which the determinant of the matrix
% multmat is less than detcutoff.  detcutoff is typically set to a
% small value, e.g. 0.005.

% Given a guess of x0, calculate the two regression lines using
% ordinary least squares
	npts = max(size(x));		% no. of data points
	A = [x-x0 x-x0 ones(1, npts)'];
% Set relevant entries of A to zero
	iseq = [1:npts];
	k = min(find(x > x0));

	A(k:npts,1) = 0;
	A(1:(k-1),2) = 0;

% Find set of coefficients
	multmat = A' * A;
	%disp('detcutoff is '); disp(detcutoff);
	if absdet(multmat) < detcutoff
% Singular matrix - cannot find coefficients
		outdat = struct('b1', NaN, 'm1', NaN, 'b2', NaN, ...
			'm2', NaN, 'x0', x0, 'y0', NaN, 'J', NaN);
		disp('Singular matrix - no attempt to solve this one')
	else
		v = inv(multmat) * A' * y;

% Extract relevant coefficients from vector v (gradients of lines and
% y0)
		m1 = v(1,:);
		m2 = v(2,:);
		y0 = v(3,:);

% Calculate y intercepts for each regression line
		b1 = y0 - m1*x0;
		b2 = y0 - m2*x0;

% Calculate cost function J (measure of goodness of fit)
		J = y' * y - 2*v' * A' * y + ...
			v' * A' * A * v;
% Pass the fitted values back in a matrix
		outdat = struct('b1', b1, 'm1', m1, 'b2', b2, ...
			'm2', m2, 'x0', x0, 'y0', y0, 'J', J);
	end
