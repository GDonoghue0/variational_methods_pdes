function [shp,shpx,shpxx] = shape_tri(p,x)
% SHAPE_TRI computes the (complete) Lagrange polynomials on a triangle
% INPUTS:
%   p: polynomial order; must be 1 or 2.
%   x: np by 2 matrix of evaluation points; np is the number of nodes.
% OUTPUTS:
%   shp: np by 3 (or 6) matrix containing Lagrange basis functions
%        evaluated at x.  The number of columns is 3 and 6 for linear and
%        quadratic polynomials, respectively.
%   shpx: np by 3 (or 6) by 2 array containing the derivative of the
%         Lagrange basis functions evaluated at x.  The number of columns 
%         is 3 and 6 for linear and quadratic polynomials, respectively.
%         shp(:,:,1) contains the x-derivative, and shp(:,:,2) constrains
%         the y-derivative.

% Copyright 2018 Masayuki Yano, University of Toronto
% Obtain interpolation nodes on reference triangle
xnodes = interp_nodes_tri(p);
% Obtain monomials for Vandermonde matrix
inv_coeff = monomial_tri(p,xnodes);
[psi,psix,psixx] = monomial_tri(p,x);

% Compute reference shape functions
shp = psi/inv_coeff;
shpx(:,:,1) = psix(:,:,1)/inv_coeff;
shpx(:,:,2) = psix(:,:,2)/inv_coeff;
shpxx(:,:,1,1) = psixx(:,:,1,1)/inv_coeff;
shpxx(:,:,2,1) = psixx(:,:,1,2)/inv_coeff;
shpxx(:,:,1,2) = psixx(:,:,2,1)/inv_coeff;
shpxx(:,:,2,2) = psixx(:,:,2,2)/inv_coeff;
end
