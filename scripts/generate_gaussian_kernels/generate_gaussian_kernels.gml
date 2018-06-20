///@arg sigma
var sigma = round(argument0);
if sigma%2 == 0 sigma-=1;

var sigPrime = floor(sigma/2)

var eul = 2.71828
var kernels = [];
var count = 0;
for( var i = -sigPrime; i < sigPrime+1; i++)
{
	kernels[count] = exp(-power(i,2)/(2*power(sigPrime,2)))/(sqrt(2*pi)*sigPrime)
	count++;
}

while array_length_1d(kernels) < 63
{
	kernels[array_length_1d(kernels)] = 0;
}

return kernels