#include <stdio.h>
#include <stdlib.h>

void mypoly( float* a, float* x, float* y, float* z, int n );

int main() {
	const int n = 200000000;
	float* a = (float*) malloc( n * sizeof(float) ); 
	float* x = (float*) malloc( n * sizeof(float) ); 
	float* y = (float*) malloc( n * sizeof(float) ); 
	float* z = (float*) malloc( n * sizeof(float) ); 
	mypoly( a, x, y, z, n );
	free( a );
	free( x );
	free( y );
	free( z );
	return 0;
}
